# AI Reflection – Assignment 5

## 1. How Did You Use AI in This Assignment?

I used AI as a learning assistant and coding guide for this assignment. I asked AI to help me understand how to create a SwiftUI app that connects to an online museum API, similar to the TheMet tutorial.

I used AI-generated code mostly as a reference, but I also read through the code and changed the app idea to use the Cleveland Museum of Art instead of The Metropolitan Museum of Art.

Example prompts I used:

* “Give me SwiftUI code for a museum navigation app using a public API.”
* “Explain how to decode JSON from an API in SwiftUI.”
* “Help me create AIReflection.md for my iOS assignment.”

Some concepts, such as `async/await`, `URLSession`, `Codable`, and `AsyncImage`, were still new to me. I researched them by reading the code comments, testing the app in Xcode, and comparing the structure with the TheMet tutorial.

## 2. How Did You Understand, Verify, and Adapt the Code?

I verified the code by running the app in the iOS Simulator. I tested the search feature using words like “painting,” “sculpture,” and “portrait.” I checked whether the app downloaded museum records and displayed artwork images, titles, dates, and details.

I also verified the code by checking for Xcode errors and using SwiftUI previews where possible. When an error appeared, I checked spelling, file names, model properties, and API field names.

One improvement I made was separating the code into different folders such as Models, Services, ViewModels, and Views. This helped me understand the responsibility of each file.

Another improvement was adding comments to the code so that I could explain what each section does. This made the project easier to understand and easier to submit.

## 3. What Did You Learn or Get Better At Through This Work?

Through this assignment, I learned how a SwiftUI app can connect to an online API and display real data. I got better at understanding how `Codable` converts JSON data into Swift objects.

I also improved my understanding of `NavigationStack`, `List`, `AsyncImage`, and `ObservableObject`. I now understand better how the ViewModel connects the API service to the SwiftUI screen.

What went well was that the app could search for museum artworks and display online images. The file structure also became clearer to me.

What was difficult was understanding the exact JSON field names from the API and matching them correctly in the Swift model. I also needed more practice with error handling and async code.

Overall, this assignment helped me become more confident in using APIs in SwiftUI and organizing a project for GitHub submission.

