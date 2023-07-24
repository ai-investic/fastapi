# AI Investic - RESTful API

Ce projet est une API RESTful développée avec FastAPI et Python sous Docker,
et est conçue pour interroger nos modèles de machine learning pour faire des prédictions.
L'API est utilisé par un formulaire du client web pour obtenir des prédictions en fonction
des données en entrée.

## Configuration requise
- Build-essential - Pour utiliser les commandes Make
- Docker (version 24) - Pour lancer les conteneurs et avoir docker compose

## Installation

1. Clonez ce dépôt de code source :
   ```bash
   git clone git@github.com:ai-investic/fastapi.git
   ```

2. Accédez au répertoire du projet :
   ```bash
   cd fastapi
   ```

## Lancement du serveur de développement

1. Lancez le serveur de développement local à l'aide de la commande suivante :
   ```bash
   make start
   ```

   Cela démarrera le serveur de développement et vous donnera une URL locale
   à laquelle vous pouvez accéder pour visualiser l'API.

2. Ouvrez votre navigateur et accédez à l'URL suivante :
   ```
   http://localhost:8000/{predict|predict_date}
   ```

   Vous devriez maintenant voir l'API en action, et vous allez pouvoir faire vos requêtes.

---

Nous espérons que ce guide vous a aidé à démarrer le projet de l'API pour faire
vos requêtes de prédiction. Si vous avez des questions supplémentaires, n'hésitez pas à les poser.
