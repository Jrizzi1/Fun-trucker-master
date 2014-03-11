Contact Info
============

Feel free to contact me with any questions.

Alec Hipshear -- ahipshea@nd.edu

Web Application Development Specialist, aka Senior Developer

Introduction
============

This app represents a simplified version of a real problem that programmers will need to deal with when working with our CMS, and I want to get a feeling for how you might solve the problem.

**It is not required that you correctly solve the problem in code**. If you are unfamiliar with Rails, or simply can't get the project running on your local machine, or you run out of time, or any number of other things happen, you can walk us through a proposed solution. The idea is to give you a real starting place with real code, and go from there.

Of course, using books and the internet is allowed.

The Problem
===========

Fun Trucker is a fake, in-development website for trucks and the people who love them. It has a front-end view for getting a list of trucks in the system, as well as viewing an individual truck. It also has an admin for creating new trucks and editing existing trucks. Currently, the admin section doesn't have a login feature, but that's OK, it hasn't launched yet.

The client insists that, on the front end, trucks can be accessed by a **fully customizable** truck-specific path, called a slug. The ID is not to be included in the slug, and the slug should be anything the admin feels like entering. This means that the path /some/great/truck should resolve to a truck with the slug matching "some/great/truck".

So far, so good. The truck admin is implemented, the truck front-end is implemented, you can access trucks on the front-end by their slug, and the client is very happy.

The client also wants to add truck rallies to the system. The admin view for truck rallies has been created, but there's a problem. Truck rallies also get a fully customizable slug! Somehow, our app is going to have to figure out whether a slug represents a truck or a rally, and render the display accordingly. Also, the app must validate that slugs are unique across both models.

In summary, your tasks are:

  * Ensure that slugs between trucks and rallies are unique: in other words, the system must prevent you from creating a truck and a rally with the same slug
  * Figure out how to display a truck or a rally based on what type of object the slug represents

Bonus points:

  * Ideally, Trucks and Rallies should have distinct front-end controllers, but this is not required

Setup Instructions
==================

This is a very simple rails application with only a few non-standard gems added. It uses sqlite for the database.

This project assumes you already have a working ruby environment on your machine, running ruby 1.9 or later. If you need help setting up ruby, contact me and we can work together on it.
All commands listed assume you are in the root of the project.

To get started, run:

  * `bundle install`
  * `rake db:setup`

If you want to view the app in the browser, run: `rails server PORT=3000`, where `3000` is any port you wish. The app will be available in the browser at http://localhost:3000 (or whatever port you chose).

To run the unit tests, run: `rake test`. Only 2 tests should fail, both located in the test/integration/slugs\_are\_king\_test.rb file. These are the tests we want to make pass.
