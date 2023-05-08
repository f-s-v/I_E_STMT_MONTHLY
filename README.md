Take-home for Ophelos

### How to Run
To run the application, simply execute the following commands:

```
rails db:create
rails db:migrate
rails server
```

### How to Test

You can run the tests with `rails test` and system tests using `rails test:system`.

### Comments and Issues

* The application is a classic Ruby on Rails application with minimal dependencies and no JavaScript.
* It has very minimal styling
* I had planned to use a custom element library as a UI framework (such as Wired Elements, Spectrum Web Components, Shoelace, etc.). However, some of them lack proper form support, and almost none of them work well with the new Rails importmaps feature. While this was an interesting challenge, it did not fit within the scope of the task.
* I also intended to use ViewComponent, but unfortunately, the ViewComponent-form did not seem to work at all for me, so I left it for future projects.
* Due to limited time, I used the standard Rails Form Builder for the forms, even without simple_form.


Thank you.