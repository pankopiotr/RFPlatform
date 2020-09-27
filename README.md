# RFPlatform
|Technology|Version|
|----------|-------|
|Ruby      |2.7.1  |
|Rails     |6.0.3  |

## Setup

### Install dependencies

```
bundle
```

### Database setup

This project uses sqlite3, so there is no need for extensive database setup.

Run migrations:
```
rails db:migrate
```

Optionally you can run this command to populate database:
```
rails db:seed
```

### Run tests
```
bundle exec rspec
```

### To enable/disable caching in development
```
rails dev:cache
```

### Run server
```
rails s
```

### Solution

#### Return list of modules sorted by category name
```
curl --location --request GET 'localhost:3000/training_modules?page=1&per_page=160'
```

#### Return list of 10 most used modules of the month
```
curl --location --request GET 'localhost:3000/training_modules/top10'
```

## About the solution

### Technicalities
* Used SQLite3 for ease of setup. There was no particular reason to go with more heavy-weight client-server RDBMS engine.
* Decided to use low-level of caching of query result instead of counter cache. At the moment we don't need to optimize this solution. Using counter would add unnecessary complexity.
* If there was a need to include category name with list of modules sorted by category name (as right now it only returns TrainingModule objects), we could either modify query (scope) to select `categories.name, training_modules.*` or simply use serializers (probably best choice here) and preload categories along with training modules to avoid N+1


### Assumptions

About listing of modules by category name:
* Sorted in ascending matter (A first, Z last)
* If module has 2 categories, it should be listed twice: One record for first category and second for second category, sorted accordingly.
* I am not sure how response should look like. Normally I would consult this with API consumers (most likely front-end). Here I am returning list of module objects sorted by category name. Module objects does not contain category name.

About Top 10 used modules of the month:
* Who is going to use those stats? Users or the business?
  - I assumed it is for users, data would be presented for example in a form of a widget somewhere on website.
  - I thought that if these statistics were for business, they would be way more complex (at least include stats about all modules), as top 10 does not give much information.
* What "of the month" means?
  - I assumed it means of last 30 days, because this way we consider fresh data and data pool enough for these stats to be stable and meaningful.
  - I thought that current calendar month would (on 2nd day of month, it takes into account only 2 days) not bring a lot of value at the beginning of the month, when there may not be enough data to provide meaningful output.
  - I thought that last calendar month (meaning it needs to be updated only once at the end of the month) would provide stale data later in the current month (as data would be few weeks old already).
* How do we calculate executions?
  - I assumed that all executions by any user are counted toward the statistic, (If a user executes a module 3 times within month, we count all 3 times). This is due to the fact that if module is good, it could be revisited by user, even within month and that modules (from what I saw in the app) are short taking at most 1 hour, so user can do it in one-sit, so user revisiting module because he did not finish it is not very likely. Plus I took one of the points in the description "Each learner can execute a module multiple times." sounded a bit like a hint to assume this approach. If we wanted to use this statistic for business or protect from abuse,  we could for example soft cap number of executes for a user within month (if user executes module 100 times, we can count only first 3) or take into account values lesser than 99th/95th percentile to avoid anomalies, but at the moment I did not see a reason to include such a mechanism, as I assumed this list is for users.

Even if some of those assumptions were incorrect, I think that cost-to-change would be quite low as most of the existing data structure would still apply. If you'd like, we can meet and discuss this.

## About the task
Description:
* Modules are individual learning games for learners.
* There are different types of modules which learners can complete, such as hands-on modules, theory modules etc.
* Modules also have a variety of attributes associated with them, e.g. Name, Description, Difficulty.
* Modules are grouped together into courses.
* One course can consist of many modules.
* Courses can overlap in modules - one module can be part of many different courses.
* Courses are formed together into categories.
* Each learner can execute a module multiple times.

Goal:
Create an application with following functionality:
* Listing of modules by category name
* TOP 10 used modules of the month
