# FDJ
Technical test for FDJ

Notes:
- The API key provided didn't seem to be working so I used "123" like the documentation suggested.

- The teams image URLs returned a 404 error. I couldn't have them working so I couldn't debug this part. I displayed placeholders instead.

- I got confused about the leagues API (all_leagues). This is not a search endpoint so you can't request the autocomplete list with a search parameter (at least I couldn't find any in the documentation - There is one is the v2 though). The example provided in the instructions just fetches the whole leagues list so I went on and filtered the list to fake a 'real' autocomplete. I'm not sure if it was what was expected. As a result, the matching rule is pretty simple (it's a strict contains or nothing).

- I kept the UI design pretty simple.  

- The presentation design pattern used here is an improvement of traditionnal MVVM better suited for the SwiftUI framework but the logic remains the same. The view models are just better separated from the logic layer (States) and we avoid the multiplication of @Published variables.

- Overall I kept things simple. Some non-exhaustive examples of what could be implemented from here:

    - A navigation layer. Here again, I kept things simple.

    - Ideally I would have implemented "loading states" to give the user more feedback from the UI (with some "activityIndicators" for instance) during loadings and some error screens so that the screen doesn't remain blank when WiFi is off. Could have also added some retry buttons, etc.

    - Models should be relative to their layers. Here for simplicity sake I used the same models throughout all the layers. Also I skipped the repositories as it would have just been some boilerplates and injected services straight into the states.
    
    - Localization files.
    
    - More tests (UI ones for instance). I only implemented a couple tests for demonstration sake.
    
    - ...
