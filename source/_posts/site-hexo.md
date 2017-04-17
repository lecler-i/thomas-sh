---
title: Mon site, sous Hexo
---

Un premier post, pour vous parler de mon site Thomas.sh...
Ca fait super longtemps que je veut faire un site/portfolio/blog-pourquoipas sans jammais avoir porter le truc jusqu'au bout

Je suis dev et un peut meticuleux comme vous allez le decouvrire, et j'avais ce gros probleme de... comment je vais le faire.
J'aurais pu le faire from scratch, mais ca m'aurais pris pas mal de temps, un wordpress? C'est pas mal mais c'est plutot lourd pour faire un blog avec 3 visiteurs et autant de contenu.
J'adore le markdown et il y a plein de solutions pour faire des sites statics en markdown.... La plus connue est [Jekyll](https://jekyllrb.com/) je suppose, qui est le choix de predeliciton pour [Github Pages](https://pages.github.com/)

J'ai fait plein de recherches et je suis tombe plutot par hazard sur [Hexo](http://hexo.io/) et c'est ce que j'utilise actuellement ! :-)

Hexo prend tout simplement des fichiers Markdown (qui vont representer les pages/posts du site) et genere un site static en HTML avec la directory structure qui va bien. Ca fait out ca en Node.js et c'est SUPER facile d'utilisation.

Ca marche exactement comme [Hugo](http://gohugo.io/) si vous connaissez, mais j'ai preferer Hexo a ce dernier car je le trouve plus simple et j'adore la communautee derniere celui-ci...
C'est d'ailleur assez special car la communautee d'Hexo est principalement Chinoise! Donc quand vous allez chercher des plugins/themes ca sera souvent en chinois... Mais je les aime beaucoup car tout ce que j'ai trouver jusque la c'est du code super propre et bien pense et des themes/functionnalitees qui sont vraiment en accord avec ce que je recherche.

La directory structure :

* sources/
  * _posts/
    hello-world.md
    post-two.md
    post-three.md
    ...
  * me/
    index.md
  * page-two/
    index.md
* themes/
* _config.yml

On retrouve simplement tout les post du blog dans le dossier `sources/__posts/` qui vont etre dater par la date de creation du fichier.
Les pages du site (comme la page [A propos de moi](/me)) dans le repertoire `sources/NOM_DE_LA_PAGE`, le nom du dossier sera l'url d'access a la page.
Et un fichier de configuration [_config.yml](https://github.com/lecler-i/thomas.sh/blob/master/_config.yml) pour gerer les plugins, themes, meta-data du site

Une fois un peut de contenu, on genere le site via la commande `hexo generate` et voila! Le site sera generer dans le dossier `public/`.

Le theme que j'utilise c'est [ochuunn](https://github.com/ochukai/hexo-theme-ochuunn) que j'ai forker pour faire une version *Dark* :
[lecler-i/hexo-theme-ochuunn-dark](https://github.com/lecler-i/hexo-theme-ochuunn-dark/)

Je host le site sous Github Pages (lecler-i.github.io), tout les fichiers .html/.js/.css sont donc sur le repo Github lecler-i/lecler-i.github.io comme le veut la convention.

Cependant, le code source en lui meme est host sur un autre repo :
[lecler-i/thomas.sh](https://github.com/lecler-i/thomas.sh)

Je m'explique :

J'ecris/customize mes pages en markdown qui sont sur le repo de source code auquelle j'y ai plugger [travis-ci](http://travis-ci.org/) qui va, pour chaque commit, generer les fichiers static html puis les pusher sur le repo qui host le site (lecler-u.github.io) !

Ca me permet d'avoir mon site qui se deploie automatiquement sur GithubPages a chaque commit et updater dans la minute avec mes modifications :-)

```yml
language: node_js

node_js:
  - "7"

script:
- yarn build

deploy:
  provider: pages
  skip_cleanup: true
  repo: 'lecler-i/lecler-i.github.io'
  target_branch: 'master'
  github_token: $GITHUB_TOKEN
  fqdn: 'https://thomas.sh'
  local_dir: 'public'
  on:
    branch: master
```

Voila, hesitez pas a faire un tour sur le site web d'Hexo et l'essayer si ca vous dit!

