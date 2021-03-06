# Namie
[![Gem Version](https://badge.fury.io/rb/namie.svg)](http://badge.fury.io/rb/namie)
[![Coverage Status](https://coveralls.io/repos/nofxx/namie/badge.svg?branch=master)](https://coveralls.io/r/nofxx/namie?branch=master)
[![Dependency Status](https://gemnasium.com/nofxx/namie.svg)](https://gemnasium.com/nofxx/namie)
[![Code Climate](https://codeclimate.com/github/nofxx/namie.svg)](https://codeclimate.com/github/nofxx/namie)
[![Build Status](https://travis-ci.org/nofxx/namie.svg?branch=master)](https://travis-ci.org/nofxx/namie)


                       .-.
                         ;  :                              .-.
                       .;:  :     .-.      . ,';.,';.      `-'    .-.
                      .;' \ :    ;   :     ;;  ;;  ;;     ;'    .;.-'
                  .:'.;    \:    `:::'-'  ';  ;;  ';   _.;:._.   `:::'
                 (__.'      `.           _;        `-'



Names as first class citizens


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
