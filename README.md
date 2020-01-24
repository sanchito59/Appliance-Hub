# Appliance Hub

## By **Chris Sanchez**

Appliance Hub is a CRUD (Create, Read, Update, Delete) application built for companies to hold product information in a database, assuring information is properly saved through use of callbacks and validation. Appliance Hub features account authorization with password encryption so that users and administrators can securely sign up and login to use the app. Users and administrators have different CRUD permissions, allowing administrators the ability to create, read, update, or delete any content, but with restricted functionality for non-administrative users.

Products are checked for correct entry of information when submitted to the database so that products never have a detail missing. Products also have reviews properly stored and associated with them in the database, with all columns of information entered for a product. The product makes use of Ruby/Rails as well as ES6 Javascript, SCSS, and Rspec testing for methods and integration.

![screenshot of landing page for product website](https://i.imgur.com/wYv2Pfe.png "read")

![screenshot of review](https://i.imgur.com/29d31kb.png "read")
- - - -
### Setup/Installation Requirements

![image of Github repository file system](https://i.imgur.com/UStodOA.jpg "read")

#### Zip:

1. Click [here](https://github.com/sanchito59/rails_5.2.4.1_appliance_hub.git) to go to the repository location where you will find the clone/download menu.

 2. Navigate to the directory (folder) that contains your browser's downloads.
 3. Double-click on **Appliance Hub** directory (folder).
 4. Open directory contents by extracting/unzipping documents from folder.
 3. Make sure your system has `Ruby 2.6.5`, `Rails 5.2.4.1` or higher, and `NPM` installed.
 4. With your tools installed, and within the folder, run `bundle install`. Make sure all gems install correctly before moving on.
 5. Next run `rake db:create`, `rake db:migrate`, and `rake db:test:prepare`. Make sure all processes complete successfully.
 6. To seed the database with test information, run `rake db:seed`. This will fill the database with 50-125 products and 3-15 reviews for each of those products.
 7. Finally, run `rails s` or `rails server` and navigate to `localhost:3000` to use **Appliance Hub**.

#### Clone:

 1. To clone the repository, from your terminal or command line enter: "git clone https://github.com/sanchito59/rails_5.2.4.1_appliance_hub.git"
 2. Once the repository finishes downloading you will need to navigate to it in the terminal/command line.
 3. Make sure your system has `Ruby 2.6.5`, `Rails 5.2.4.1` or higher, and `NPM` installed.
 4. With your tools installed, and within the folder, run `bundle install`. Make sure all gems install correctly before moving on.
 5. Next run `rake db:create`, `rake db:migrate`, and `rake db:test:prepare`. Make sure all processes complete successfully.
 6. To seed the database with test information, run `rake db:seed`. This will fill the database with 50-125 products and 3-15 reviews for each of those products.
 7. Finally, run `rails s` or `rails server` and navigate to `localhost:3000` to use **Appliance Hub**.

- - - -

### Specifications:

|Behavior|Input|Output|
|---|---|---|
|(Read/GET)|User is on the homepage. |Homepage displays featured products and navigation to view all products. |
|(Create/POST) User adds a product to the catalogue of products. |'Vasiva HVAC Comp'|The corresponding pages now have the product added and so does the database. The user is shown a message to inform them of the successful creation.|
|(Read/GET)|User is on the product page. |Product page displays a list of all products. Included is the ability to create products.|
|(Update/PATCH) User changes the product. |'Fire System Alarms'|All pages reflect the changes and so does the database.|
|(Create/POST) User adds a review to the product. |Reviews contain information such as author, review text, and rating.|The product page now has the review added and so does the database. The user is shown a message to inform them of successfully changes.|
|(Update/PATCH) User changes the review's author. |'Michael Smith'|The product page now reflects the changes and so does the database. The user is shown a message to inform them of successful changes.|
|(Delete/DELETE) The user removes a review from a product. |Review for 'Fire System Alarms' is deleted.|The product page now reflects the changes and so does the database. The user is shown a message to inform them of successful changes.|
|(Delete/DELETE) The user deletes a product. |'Fire System Alarms'|The database and all corresponding pages no longer have the product.|
- - - -

### Technologies Used

 - Ruby 2.6.5
 - Rails 5.2.4.1
 - PostgreSQL 12.1
 - Database Seeding
 - Database Querying
 - Behavior Driven Development / User Stories
 - Testing for Behavior and Integration

- - - -
### Support and Contact

If you run into any issues running **Appliance Hub**, please contact **Chris Sanchez**.

### License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2020 **Chris Sanchez**
