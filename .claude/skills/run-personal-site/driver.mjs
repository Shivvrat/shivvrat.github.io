// Headless-Chromium driver for the personal Jekyll site (fallback for when
// chromium-cli isn't installed). Usage:
//   node driver.mjs <url> <screenshot-out-path>
// Prints the page title and any console/page errors, then screenshots.
import { chromium } from "playwright-core";

const [, , url, outPath] = process.argv;
if (!url || !outPath) {
  console.error("usage: node driver.mjs <url> <screenshot-out-path>");
  process.exit(1);
}

const browser = await chromium.launch({ args: ["--no-sandbox"] });
const page = await browser.newPage({ viewport: { width: 1280, height: 900 } });
const errors = [];
page.on("console", (msg) => {
  if (msg.type() === "error") errors.push(msg.text());
});
page.on("pageerror", (err) => errors.push(String(err)));

await page.goto(url, { waitUntil: "networkidle", timeout: 30000 });
const title = await page.title();
await page.screenshot({ path: outPath, fullPage: true });

console.log("title:", title);
console.log("console errors:", errors.length ? errors : "none");
await browser.close();
