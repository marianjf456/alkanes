import path from "path";
import fs from "node:fs";

// temp until protorunes exports this
function findRootDir(currentDir: string): string {
  const parentDir = path.resolve(currentDir, "..");

  if (fs.existsSync(path.join(currentDir, "package.json"))) {
    return currentDir;
  } else if (currentDir === parentDir) {
    // If we reach the root directory of the file system, throw an error.
    throw new Error("Root directory not found");
  } else {
    // Recur with the parent directory.
    return findRootDir(parentDir);
  }
}

const DEBUG_WASM_PATH = path.join(
  findRootDir(__dirname),
  "build",
  "combined-out.wasm"
);

console.log(DEBUG_WASM_PATH);

export const DEBUG_WASM = fs.readFileSync(DEBUG_WASM_PATH);
