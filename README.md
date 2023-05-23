<h2 align="center">CXBOX Doc</h2>
<div align="center">
<a href="https://github.com/CX-Box/cxbox-doc/actions/workflows/build_main.yml"><img src="https://github.com/CX-Box/cxbox-doc/actions/workflows/build_main.yml/badge.svg" title="">
</a>
</div>


<blockquote>
<div> 
<p align="center">
<h4 align="center">CXBOX - Rapid Enterprise Level Application Development Platform</h4>

<p align="center">
<a href="http://www.apache.org/licenses/LICENSE-2.0"><img src="https://img.shields.io/badge/license-Apache%20License%202.0-blue.svg?style=flat" alt="license" title=""></a>
</p>

<div align="center">
  <h3>
    <a href="http://cxbox.org/" target="_blank">
      Website
    </a>
    <span> | </span>
    <a href="http://demo.cxbox.org/" target="_blank">
      Demo
    </a>
    <span> | </span>
    <a href="http://doc.cxbox.org/" target="_blank">
      Documentation
    </a>
  </h3>

</div>



<h3>Description</h2>
<p>
CXBOX main purpose is to speed up development of typical Enterprise Level Application based on Spring Boot. A fixed
contract with a user interface called <a href="https://github.com/CX-Box/cxbox-ui" target="_blank">Cxbox-UI</a> allows backend developer to create
typical interfaces providing just Json meta files. Full set of typical Enterprise Level UI components included -
widgets, fields, layouts (views), navigation (screens).
</p>
</div>

<h3>Using CXBOX</h2>
<ul>
<li> <a href="https://plugins.jetbrains.com/plugin/19523-tesler-helper" target="_blank">download Intellij Plugin</a> adds platform specific autocomplete, inspection, navigation and code generation features.
</li>
<li>
 <a href="https://github.com/CX-Box/cxbox-demo" target="_blank">download Demo</a> and follow <a href="https://github.com/CX-Box/cxbox-demo#readme" target="_blank">README.md</a> instructions. Feel free to use demo as template project to start your own projects
</li>
</ul>
</blockquote>

# CXBOX Docs
## Prerequisites:

#####

* docker
* docker-compose

## Getting started

* [download docs](https://github.com/CX-Box/cxbox-doc) source code

* start dev environment [localhost:8000](http://localhost:8000)

```shell
docker-compose up -d
```
any change made locally in .md files will immediately available on [localhost:8000](http://localhost:8000) without restart

## Deploying to production
Any change in main branch is published to Github-pages automatically


## License

CXBox Docs is an open-source project with the [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) license