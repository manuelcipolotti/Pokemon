# Pokemon
Pokemon list with simple detail from Pokemon API

The request to Pokemon API are created with native URLSession, an external library it isn't necessary, the API are very simple.

The library SDWebImage are used for caching the image of the Pokémon.

The minimun SDK supported is iOS 11, and Combine is excluded.

App manage few data, then the binding from ViewModel to ViewController via Boxing, and is managed by  the class BoxBinding.

The views are build with StackView, that helps to manage different screen size (iPad and iPhone) and organize the layout.

