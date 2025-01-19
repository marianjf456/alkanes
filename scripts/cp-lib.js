const fs = require('fs-extra');
const path = require('path');

const srcDir = path.join(__dirname, '../src.ts');
const destDir = path.join(__dirname, '../jsonrpc/src.ts/lib');

async function copyFiles() {
  try {
    await fs.ensureDir(destDir);
    await fs.copy(srcDir, destDir, {
      filter: (src) => !src.includes('node_modules')
    });
    console.log('Successfully copied src.ts files to jsonrpc/src.ts/lib');
  } catch (err) {
    console.error('Error copying files:', err);
    process.exit(1);
  }
}

copyFiles();
