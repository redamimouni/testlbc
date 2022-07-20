# test Leboncoin

Ceci est un projet pour le test technique pour Leboncoin.
Ce readme décrit l'avancement du test technique [[technical-test] iOS.pdf](https://github.com/redamimouni/testlbc/files/9147088/technical-test.iOS.pdf)
.

### Architecture

Clean architecture avec un découpage "View -> Presenter -> Domain -> data", le but est de séparer les responsabilités et de facilités les tests de chaque brique de l'app.

Un coordinator est mis en place pour gérer la navigation dans l'app et gére également l'injection de dépendance.

### Test unitaire

Presenter et UseCase sont testé unitairement, difficile de créer des mocks à la main sans passer par une librairie externe (e.g: SwiftyMocky)

### Done

Projet compatible iOS 14+ :heavy_check_mark: 
UI custom avec du code :heavy_check_mark: 
Pas de librairie externe :heavy_check_mark: 

### Missing
1. Fetch des images et catégories: je n'ai pas eu le temps d'attaquer cette partie, ca aurait était plus facile de le faire si je pouvais utiliser ```async await``` (sur iOS 15+) ,  ```RxSwift``` ou autres librairies ou autre archi (MVVM)
2. Injection de dépendance: je pense que l'injection peut se faire mieux avec des modules.
3. La vue détail: je met en cache l'appel API vers la liste, c'est plus facile d'aller chercher le detail.
4. Le presenter peut envoyer une erreur mais qui n'est pas gérer coté vue.
5. Test unitaire: j'ai couvert le presenter et le use case mais pas le repository par manque de temps.
