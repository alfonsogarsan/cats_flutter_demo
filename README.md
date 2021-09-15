# cats

This is a flutter demo app that shows a different random cat picture from cataas API every time user clicks on button. And stacked them in the screen.

This project uses **Provider** package to manage state in Flutter and try to organize the code following a **Clean Architecture**.

## Architecture explained

You can find different layers like: Data, Presentation and Domain. Both Data and Presentation depend on Domain.

Domain encapsulates business logic through entities and use cases. Domain also has repository **interfaces** while Data layer has their **implementations**. This way Data layer depends on Domain.

In Presentation you can find ui-related entities or classes like pages, widgets, providers, and more.... Presentation depends on domain entities although presentation has its own ui-related entities. Presentation also depends on domain when providers call domain use-cases.

Data layer implements, as I said before, repository interfaces (in domain). So when domain use-cases call repository functions, they do it through the interfaces in its own layer (domain), which are implemented by classes in data layer. This way the dependency is inverted so data depends on domain.

Data repository implementations have different ways to access data (backend data included). So communications, through services, are managed here, in Data layer.

Data models are intermmediate classes that maps communication-related entities to domain entities and vice versa.


## Dependencies management

Considering the projetc size, I don't use dependency injection pattern but a service locator approach, through the get_it dart package.


## Other things to consider...

- Custom CircularProgressIconButton with two states: Icon (with onPressed behaviour) and Circular progress indicator
- It generates valid expressions with different types of brackets: ()[]{} and shows them as titles below cat pictures and as token-bearer-fictional authentication.

....

And nothing else... I hope you can find this project useful and enjoyable!!

Thanks for reading!
