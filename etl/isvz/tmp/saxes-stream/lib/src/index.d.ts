/// <reference types="node" />
import { Transform, TransformOptions, TransformCallback } from "stream";
import { SaxesParser, SaxesOptions, SaxesTag } from "saxes";
export { SaxesOptions } from "saxes";
export declare type SaxesStreamChunk = {
    event: "opentag";
    path: string;
    tag: SaxesTag;
} | {
    event: "text";
    path: string;
    text: string;
} | {
    event: "closetag";
    path: string;
    tag: SaxesTag;
};
export declare class SaxesStream extends Transform {
    parser: SaxesParser;
    path: string;
    constructor(saxesOptions?: SaxesOptions, streamOptions?: TransformOptions);
    push(chunk: SaxesStreamChunk, encoding?: string): boolean;
    _transform(chunk: string, encoding: string, callback: TransformCallback): void;
    _flush(callback: TransformCallback): void;
}
