const puppeteer = require('puppeteer')
const express = require('express')
const serveStatic = require('serve-static')

async function main() {
  try {
    const app = express()
    app.use(serveStatic('./build', { index: ['index.html'] }))
    app.listen(3001)

    const browser = await puppeteer.launch({
      args: [
        '--no-sandbox',
        '--disable-setuid-sandbox',
        '--disable-blink-features=LayoutNGPrinting',
      ],
    })
    const page = await browser.newPage()
    await page.goto('http://localhost:3001', { waitUntil: 'networkidle2' })
    await page.pdf({
      path: 'build/resume.pdf',
      width: '8.5in',
      height: '11in',
    })

    await browser.close()
  } catch (exception) {
    console.error(exception)
    process.exit(1)
  }

  process.exit(0)
}

main()
