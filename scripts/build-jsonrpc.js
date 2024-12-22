const path = require("node:path");
const child_process = require("node:child_process");

process.chdir(path.join(__dirname, "..", "jsonrpc"));
child_process.spawnSync("tsc", [], { stdio: "inherit" });
