param(
    [ValidateSet('image', 'build', 'compile', 'serve', 'dev', 'run', 'publish', 'shell', 'help')]
    [string]$Command = 'serve'
)

$ErrorActionPreference = 'Stop'

$imageName = 'shivvrat-jekyll'
$repoRoot = (Resolve-Path $PSScriptRoot).Path

function Get-GitIdentity {
    $defaultName = 'Shivvrat Arya'
    $defaultEmail = 'shivvrat.arya@users.noreply.github.com'

    $gitName = (git -C $repoRoot config --get user.name 2>$null)
    $gitEmail = (git -C $repoRoot config --get user.email 2>$null)

    if (-not $gitName) {
        $gitName = $defaultName
    }

    if (-not $gitEmail) {
        $gitEmail = $defaultEmail
    }

    return @{
        GIT_AUTHOR_NAME     = $gitName
        GIT_AUTHOR_EMAIL    = $gitEmail
        GIT_COMMITTER_NAME  = $gitName
        GIT_COMMITTER_EMAIL = $gitEmail
    }
}

function Invoke-Docker {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Arguments
    )

    & docker @Arguments
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

function Build-Image {
    Invoke-Docker -Arguments @('build', '-t', $imageName, $repoRoot)
}

function Compile-Site {
    Invoke-Docker -Arguments @(
        'run', '--rm', '-it',
        '-v', "${repoRoot}:/srv/jekyll",
        '-e', 'BUNDLE_FROZEN=1',
        $imageName,
        'bundle', 'exec', 'jekyll', 'build'
    )
}

function Serve-Site {
    Invoke-Docker -Arguments @(
        'run', '--rm', '-it',
        '-p', '4000:4000',
        '-p', '35729:35729',
        '-v', "${repoRoot}:/srv/jekyll",
        '-e', 'BUNDLE_FROZEN=1',
        $imageName,
        'sh', '-c', 'echo "Local URL: http://localhost:4000" && bundle exec jekyll serve --config _config.yml,_config_docker.yml --livereload --trace --force_polling'
    )
}

function Publish-Site {
    $sshDir = if ($env:SSH_KEY_DIR) { $env:SSH_KEY_DIR } else { Join-Path $HOME '.ssh' }

    if (-not (Test-Path $sshDir)) {
        throw "Set SSH_KEY_DIR to your SSH key directory before publishing."
    }

    $gitIdentity = Get-GitIdentity

    Invoke-Docker -Arguments @(
        'run', '--rm', '-it',
        '-v', "${repoRoot}:/srv/jekyll",
        '-v', "${sshDir}:/root/.ssh",
        '-e', 'BUNDLE_FROZEN=1',
        '-e', "GIT_AUTHOR_NAME=$($gitIdentity.GIT_AUTHOR_NAME)",
        '-e', "GIT_AUTHOR_EMAIL=$($gitIdentity.GIT_AUTHOR_EMAIL)",
        '-e', "GIT_COMMITTER_NAME=$($gitIdentity.GIT_COMMITTER_NAME)",
        '-e', "GIT_COMMITTER_EMAIL=$($gitIdentity.GIT_COMMITTER_EMAIL)",
        '-e', 'GIT_SSH_COMMAND=ssh -o StrictHostKeyChecking=accept-new',
        $imageName,
        'bundle', 'exec', 'rake', 'publish', '--trace'
    )
}

function Open-Shell {
    Invoke-Docker -Arguments @(
        'run', '--rm', '-it',
        '-v', "${repoRoot}:/srv/jekyll",
        '-e', 'BUNDLE_FROZEN=1',
        $imageName,
        '/bin/bash'
    )
}

function Show-Usage {
    @'
Usage: .\docker-jekyll.ps1 <image|build|compile|serve|dev|run|publish|shell>

Commands:
  image    Build the Docker image.
  build    Alias for compile.
  compile  Build the Jekyll site inside Docker.
  serve    Start the local Jekyll server on http://localhost:4000.
  publish  Compile and publish the site from inside Docker.
  shell    Open a shell inside the container.
'@ | Write-Host
}

switch ($Command) {
    'image' {
        Build-Image
    }
    'build' { 
        Build-Image
        Compile-Site
    }
    'compile' {
        Build-Image
        Compile-Site
    }
    'serve' {
        Build-Image
        Serve-Site
    }
    'dev' {
        Build-Image
        Serve-Site
    }
    'run' {
        Build-Image
        Serve-Site
    }
    'publish' {
        Build-Image
        Publish-Site
    }
    'shell' {
        Build-Image
        Open-Shell
    }
    default {
        Show-Usage
    }
}
