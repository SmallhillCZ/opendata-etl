"use strict";
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
var stream_1 = require("stream");
var saxes_1 = require("saxes");
var SaxesStream = /** @class */ (function (_super) {
    __extends(SaxesStream, _super);
    function SaxesStream(saxesOptions, streamOptions) {
        if (saxesOptions === void 0) { saxesOptions = {}; }
        if (streamOptions === void 0) { streamOptions = {}; }
        var _this = this;
        var defaultStreamOptions = {
            readableObjectMode: true,
            writableObjectMode: false
        };
        streamOptions = Object.assign(defaultStreamOptions, streamOptions);
        _this = _super.call(this, streamOptions) || this;
        _this.path = "";
        _this.parser = new saxes_1.SaxesParser(saxesOptions);
        _this.parser.onopentag = function (tag) {
            _this.path = [_this.path, tag.name].join(".");
            _this.push({ path: _this.path, event: "opentag", tag: tag });
        };
        _this.parser.ontext = function (text) {
            _this.push({ path: _this.path, event: "text", text: text });
        };
        _this.parser.onclosetag = function (tag) {
            _this.push({ path: _this.path, event: "closetag", tag: tag });
            _this.path = _this.path.replace(/\.[^\.]+$/u, "");
        };
        return _this;
    }
    SaxesStream.prototype.push = function (chunk, encoding) {
        return _super.prototype.push.call(this, chunk, encoding);
    };
    SaxesStream.prototype._transform = function (chunk, encoding, callback) {
        this.parser.write(chunk);
        callback();
    };
    SaxesStream.prototype._flush = function (callback) {
        this.parser.close();
        callback();
    };
    return SaxesStream;
}(stream_1.Transform));
exports.SaxesStream = SaxesStream;
