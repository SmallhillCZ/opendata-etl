"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var src_1 = require("../src");
describe("Should parse XML correctly", function () {
    var parser = new src_1.SaxesStream();
    var events = [];
    var error;
    parser.on("data", function (data) { return events.push(data); });
    parser.on("error", function (err) { return error = err; });
    test("Output is as expected", function () {
        parser.on("finish", function () {
            expect(events).toEqual([
                { event: "opentag", path: ".books", tag: { name: "books", isSelfClosing: false, attributes: {} } },
                { event: "opentag", path: ".books.book", tag: { name: "book", isSelfClosing: false, attributes: {} } },
                { event: "opentag", path: ".books.book.name", tag: { name: "name", isSelfClosing: false, attributes: {} } },
                { event: "text", path: ".books.book.name", text: "Book" },
                { event: "closetag", path: ".books.book.name", tag: { name: "name", isSelfClosing: false, attributes: {} } },
                { event: "opentag", path: ".books.book.description", tag: { name: "description", isSelfClosing: false, attributes: {} } },
                { event: "text", path: ".books.book.description", text: "Description" },
                { event: "closetag", path: ".books.book.description", tag: { name: "description", isSelfClosing: false, attributes: {} } },
                { event: "closetag", path: ".books.book", tag: { name: "book", isSelfClosing: false, attributes: {} } },
                { event: "closetag", path: ".books", tag: { name: "books", isSelfClosing: false, attributes: {} } }
            ]);
        });
    });
    test("No error was emitted", function () {
        parser.on("finish", function () {
            expect(error).toBe(undefined);
        });
    });
    parser.write("<books><book><name>Book</name><description>Description</description></book></books>");
    parser.end();
});
