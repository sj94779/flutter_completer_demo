//
// To give an example, in one of my projects I had to get the resolution info of network images. To do that, you need something like this: https://stackoverflow.com/a/44683714/10380182
//
// In there, as you see, after getting the image we do a resolve process which may take time even though it's not an async process. To eliminate that blocking we simply use Completer.
//
// Also the info we need exists inside a callback, so it will be cleaner to use Completer in there. Then, we use it via FutureBuilder. You can approach different but this is very convenient way to handle.
