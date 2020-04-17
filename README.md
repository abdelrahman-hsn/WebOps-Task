# WebOps Task

#### Description Task
> Blog Application

##### Things you may want to cover:
- Ruby version: 2.6.5
- Rails Versiom: 6.0.2
- Redis Version: 4.0.9
- Database: Mysql
- Workers: Sidekiq
### Postman Api Test
[Link Collection Postman](https://www.getpostman.com/collections/c94d88cfcec6d0568f2c)
### How To Run Project
```sh
$ git clone git@github.com:Abd-El-Rahman-HSN/WebOps-Task.git
$ cd WebOps-Task
$ bundle install
```
#### Create Data Base
```sh
$ rails db:create
$ rails db:migrate
```
#### Run Project
```sh
$ rails s
$ bundle exec sidekiq
```

#### Run Docker
```sh
$ docker-compose up --build 
```