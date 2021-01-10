# human_bytes

Converts bytes into human-friendly strings.

> Note that it uses base-10 (e.g. kilobyte). [Read about the difference between kilobyte and kibibyte.](https://web.archive.org/web/20150324153922/https://pacoup.com/2009/05/26/kb-kb-kib-whats-up-with-that/)

## Install

```shell
$ v install human_bytes # or
```

## Use

```v
import human_bytes { convert, convert_opt }

// Normal conversions
convert(10) // 10 B
convert(1001) // 1 kB

// Conversions with options
convert_opt(1001, signed: true) // +1 kB
convert_opt(1001, bits: true) // 1 kbit
convert_opt(1e16, binary: true) // 8.88 PiB
convert_opt(1025, bits: true, binary: true, signed: true) // +1 kibit
```

## API

### `convert(input_val)`

#### input_val `f64`

The number to format.

### `convert_opt(input_val, options)`

#### options `struct Options`

##### signed `bool = false`

Include plus sign for positive numbers. If the difference is exactly zero a space character will be prepended instead for better alignment.

##### bits `bool = false`

Format the number as [bits](https://en.wikipedia.org/wiki/Bit) instead of [bytes](https://en.wikipedia.org/wiki/Byte). This can be useful when, for example, referring to [bit rate](https://en.wikipedia.org/wiki/Bit_rate).

##### binary `bool = false`

Format the number using the [Binary Prefix](https://en.wikipedia.org/wiki/Binary_prefix) instead of the [SI Prefix](https://en.wikipedia.org/wiki/SI_Prefix). This can be useful for presenting memory amounts. However, this should not be used for presenting file sizes.

## Thanks

This work is based on [pretty-bytes](https://github.com/sindresorhus/pretty-bytes) for JavaScript by [Sindre](https://github.com/sindresorhus/pretty-bytes).
