
                       .-.
                         ;  :                              .-.
                       .;:  :     .-.      . ,';.,';.      `-'    .-.
                      .;' \ :    ;   :     ;;  ;;  ;;     ;'    .;.-'
                  .:'.;    \:    `:::'-'  ';  ;;  ';   _.;:._.   `:::'
                 (__.'      `.           _;        `-'



Names as first class citizens

[![Gem Version](https://badge.fury.io/rb/namie.png)](http://badge.fury.io/rb/namie)
[![Code Climate](https://codeclimate.com/github/nofxx/namie.png)](https://codeclimate.com/github/nofxx/namie)
[![Coverage Status](https://coveralls.io/repos/nofxx/namie/badge.png)](https://coveralls.io/r/nofxx/namie)
[![Build Status](https://travis-ci.org/nofxx/namie.png?branch=master)](https://travis-ci.org/nofxx/namie)

## Install


    gem 'namie'


## Use


```
name = Name.new('Jules Verne')
name.first  # 'Jules'
name.last   # 'Verne'
name.to_s   # 'Jules Verne'
```


Accepts prefix, suffix and middlenames:

```
name = Name.new('Sir Arthur C. Clark')
name.title  # 'Sir'
name.first  # 'Arthur'
name.last   # 'Clark'
name.to_s("%l %m, %f")  # Clark C., Arthur
```

Accepts and detects company names and suffixes:

```
name = Name.new('ACME Corp LLC')
name.first  # 'ACME'
name.last   # 'Corp'
name.suffix # 'LLC'
```


## ActiveModel

Working on it:

* to params hash
* cached/customizable string
* sanitized string
