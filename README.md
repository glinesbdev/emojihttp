# Emoji HTTP

A simple [Emojicode](https://www.emojicode.org/) HTTP library to get data from the internet!

> ⚠️ This software has not been tested on Windows! ⚠️

## Setup

The required packages needed to use this library are:

* 📦 json 🏠
* 📦 sockets 🏠
* 📦 emojihttp 🌐

## Examples

```emojicode
💭 A basic GET request

🆕🔶🌐🗺️ 🔤jsonplaceholder.typicode.com🔤 🔤/todos/1🔤❗ ➡️ json_get_request

🆗 🚀request❗ 🍇
  😀 💪request❗❗
🍉
🙅 error 🍇
  😀 💬error❗❗
🍉
```

You can find many more examples in the [request tests](./tests/request_test.emojic) file.

## Tests

To run the test suite, you must have [GNU Make](https://www.gnu.org/software/make/) installed on your machine.

```bash
make test
```

## Building the package

```bash
make package
```
