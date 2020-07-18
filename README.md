![release badge](https://img.shields.io/github/v/release/santiago-rodrig/alpha-blog)
![website state badge](https://img.shields.io/website?down_color=lightgrey&down_message=offline&up_color=green&up_message=online&url=https%3A%2F%2Fsrodrig-alpha-blog.herokuapp.com)
![license badge](https://img.shields.io/github/license/santiago-rodrig/alpha-blog)
![followers](https://img.shields.io/github/followers/santiago-rodrig?style=social)
![stars](https://img.shields.io/github/stars/santiago-rodrig/alpha-blog?style=social)

# Alpha Blog

[live version](https://srodrig-alpha-blog.herokuapp.com/)

![app demo gif](./doc/demo.gif)

A blog built with Ruby on Rails 6, among its features is included
sessions management, articles, and categories. It is fully tested, you may
use it with confidence.

## Table of contents

- [Requirements](https://github.com/santiago-rodrig/alpha-blog#requirements)
- [Setup](https://github.com/santiago-rodrig/alpha-blog#setup)
- [Collaboration](https://github.com/santiago-rodrig/alpha-blog#collaboration)
- [License](https://github.com/santiago-rodrig/alpha-blog#license)
- [Contact](https://github.com/santiago-rodrig/alpha-blog#contact)


## Requirements

- [Ruby](https://www.ruby-lang.org/en/) (~> 2.6)
- [Ruby on Rails](https://rubyonrails.org/) (~> 6.0.3)
- [Node](https://nodejs.org/en/) (~> v14.5.0)
- [Yarn](https://yarnpkg.com/getting-started/install) (~> 1.22.4)
- [Bundler](https://github.com/rubygems/rubygems/tree/master/bundler) (~> 2.1.4)

## Setup

First and foremost, clone this repository (and give it a star).

```sh
git clone https://github.com/santiago-rodrig/alpha-blog.git && cd alpha-blog
```

Install the dependencies for the project.

```sh
bundle config set without 'production' && \
bundle install && yarn install --check-files
```

Run the database migrations.

```sh
rails db:migrate
```

Optionally, run the tests to make sure everything is OK.

```sh
rails test
```

Optionally (again), you may populate your development database with
dummy data and see how it will look like when users start to login and
create articles.

```sh
rais db:seed
```

Now everything is set up, you may fire up the local web server.

```sh
rails server
```

You'll want to visit [localhost at port 3000](http://localhost:3000) now.

## Collaboration

To collaborate to this project first fork the repository, after that, create a new branch based
on [develop](https://github.com/santiago-rodrig/alpha-blog/tree/develop)
(using [Git-flow](https://nvie.com/posts/a-successful-git-branching-model/)
is recommended), push your branch to your forked repository and create a PR (Pull Request)
from your branch to the develop branch of the original repository.

## License

This project is MIT licensed, you can [read the license here](./LICENSE).

## Contact

You can reach out to me through the following URLs.

- [My website](https://santiagorodriguez.dev)
- [Github](https://github.com/santiago-rodrig)
- [LinkedIn](https://www.linkedin.com/in/santiago-andres-rodriguez-marquez/)
- [AngelList](https://angel.co/u/santiago-andres-rodriguez-marquez)
- [santo1996.29@gmail.com](mailto:santo1996.29@gmail.com)

