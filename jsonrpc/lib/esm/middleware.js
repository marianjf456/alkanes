"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.logMiddleware = logMiddleware;
const utils_1 = require("./utils");
const logger_1 = require("./logger");
const logger = (0, logger_1.getLogger)();
function logMiddleware(req, res, next) {
    const ip = req.get("X-Real-IP");
    logger.info(ip + "|" + (0, utils_1.dumpJSONRPCPayload)(req.body));
    next();
}
//# sourceMappingURL=middleware.js.map