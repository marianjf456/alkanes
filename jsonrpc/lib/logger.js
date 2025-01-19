"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getLogger = getLogger;
const winston_1 = require("winston");
const customLevels = {
    error: 0,
    warn: 1,
    data: 2,
    info: 3,
    debug: 4,
    verbose: 5,
    silly: 6,
    custom: 7,
};
const customColors = {
    error: "red",
    warn: "yellow",
    data: "grey",
    info: "green",
    debug: "red",
    verbose: "cyan",
    silly: "magenta",
    custom: "blue",
};
/*
const customFormatter = ({ level, message, label, timestamp }: any): string => {
  return `${label}|${timestamp}|${level}|${
    typeof message === "string"
      ? message
      : util.inspect(message, { colors: true, depth: 15 })
  }`;
};
*/
const createLogger = (proc) => {
    (0, winston_1.addColors)(customColors);
    const logger = (0, winston_1.createLogger)({
        defaultMeta: {
            service: proc || "alkanes-rpc",
        },
        levels: customLevels,
        format: winston_1.format.combine(winston_1.format.errors({ stack: true }), winston_1.format.json()),
        transports: [
            new winston_1.transports.Console({
                level: "verbose",
                format: winston_1.format.combine(winston_1.format.label({ label: proc }), winston_1.format.timestamp()),
            }),
        ],
    });
    return logger;
};
const logger = createLogger(require("../package").name);
function getLogger() {
    return logger;
}
//# sourceMappingURL=logger.js.map