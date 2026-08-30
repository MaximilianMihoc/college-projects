# Programming Coursework

Three early programming projects focused on C fundamentals, dynamic memory management, and a small learning conversational agent in C#.

## DANI — Dynamic Artificial Non-Intelligence

`DANI(DynamicArtificialNONInteligence)/` is a console-based conversational agent inspired by science-fiction computers. It learns transitions between words from seed text and from the user's conversation, effectively building a directed word graph similar to a simple Markov chain.

Responses begin from a word in the user's input where possible, then choose following words with probabilities influenced by observed frequencies. The program avoids repeated links, recognizes common question openings, can persist new input to `book.txt`, and optionally speaks replies through `System.Speech.Synthesis`.

## Hangman

`Hangman/` is a first C game. It randomly selects one of five words, accepts and normalizes letter guesses, tracks previously entered letters and six lives, reveals matched positions, and supports replay. The original flowchart is preserved in `HangManFlowChart.docx`.

## Dynamic memory allocation exercises

`DynamicMemoryAllocation/` contains focused C examples using `malloc`, `calloc`, and `realloc`: allocating arrays, calculating averages, sorting numbers in ascending order, and extending an existing memory block.

## What I practised

- Arrays, strings, loops, input validation, and game state in C.
- Manual memory allocation and resizing.
- C# classes, collections, file I/O, weighted random selection, and text-to-speech.
- Representing language as words connected by observed transitions.

## Running the projects

Compile the C files individually with a C compiler; several use functions considered unsafe by modern toolchains and may need minor edits. Open `Dani3.sln` with a compatible Visual Studio/.NET Framework environment. DANI expects a `book.txt` seed file beside the executable and uses Windows speech synthesis.
