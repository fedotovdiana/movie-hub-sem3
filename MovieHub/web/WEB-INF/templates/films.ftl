<#include 'header.ftl'>
<#include 'libraries.ftl'>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="../../front/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../front/css/style.css" type="text/css">
    <title>Films</title>
</head>
<body class="photo">
<@header/>
<section class="jumbotron text-center">
    <div class="container">
        <h2 class="jumbotron-heading">Films</h2>
    </div>
</section>
<div class="container">
    <div class="row">
        <form>
            <div>
                <div class="col-auto my-1" >
                    <div class="form-group help">
                        <input type="text" class="form-control" id="query" oninput="f()" placeholder="Find films...">
                    </div>
                </div>
                <script type="application/javascript">
                    function f() {
                        if ($("#query").val().length >= 1) {
                            $.ajax({
                                url: "/dosearch",
                                data: {"query": $("#query").val()},
                                dataType: "json",
                                success: function (msg) {
                                    if (msg.objects.length > 0) {
                                        $("#res").html("");
                                        for (var i = 0; i < msg.objects.length; i++) {
                                            $("#res").append("<div class=\"col-md-3\">\n" +
                                                "                <div class=\"card mb-4\">\n" +
                                                "                    <a href=\"/film?film_id=" + msg.objects[i].id + "&name=" + msg.objects[i].name + "\"><img src=\"../../front/img/" + msg.objects[i].photo + "\"\n" +
                                                "                                                                        class=\"img-thumbnail\" alt=\"...\"></a>\n" +
                                                "                    <div class=\"card-body\">\n" +
                                                "                        <ul class=\"list-unstyled text-center mb-2\">\n" +
                                                "                            <li>\n" +
                                                "                            </li>\n" +
                                                "                            <li><a href=\"/film?film_id=" + msg.objects[i].id + "&name=" + msg.objects[i].name + "\" class=\"reg\">" + msg.objects[i].name + "<br>" + msg.objects[i].date + "</a>\n" +
                                                "                            </li>\n" +
                                                "                        </ul>\n" +
                                                "                    </div>\n" +
                                                "                </div>\n" +
                                                "            </div>");
                                        }
                                    } else {
                                        $("#res").html("<h2><a href='#'>No results</a></h2>");
                                    }
                                }
                            })
                        } else {
                            $("#res").html("<#list films as f><div class=\"col-md-3\">\n" +
                                "                <div class=\"card mb-4\">\n" +
                                "                    <a href=\"/film?film_id=${f.id}&name=${f.name}\"><img src=\"../../front/img/${f.photo}\"\n" +
                                "                                                                        class=\"img-thumbnail\" alt=\"...\"></a>\n" +
                                "                    <div class=\"card-body\">\n" +
                                "                        <ul class=\"list-unstyled text-center mb-2\">\n" +
                                "                            <li>\n" +
                                "                            </li>\n" +
                                "                            <li><a href=\"/film?film_id=${f.id}&name=${f.name}\" class=\"reg\">${f.name}<br>${f.date}</a>\n" +
                                "                            </li>\n" +
                                "                        </ul>\n" +
                                "                    </div>\n" +
                                "                </div>\n" +
                                "            </div></#list>");
                        }
                    }
                </script>
            </div>
        </form>
    </div>
    <div class="row" id="res">
        <#list films as f>
            <div class="col-md-3">
                <div class="card mb-4">
                    <a href="/film?film_id=${f.id}&name=${f.name}"><img src="../../front/img/${f.photo}"
                                                                        class="img-thumbnail" alt="..."></a>
                    <div class="card-body">
                        <ul class="list-unstyled text-center mb-2">
                            <li>
                                <#--                                <h8 class="display-4 like">318 |</h8>-->
                                <#--                                <h8 class="display-4 dislike">5</h8>-->
                            </li>
                            <li><a href="/film?film_id=${f.id}&name=${f.name}" class="reg">${f.name}<br>${f.date}</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </#list>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>

<#--                <div class="col-auto my-1">-->
<#--                    <select class="custom-select mr-sm-2" id="inlineFormCustomSelect">-->
<#--                        <option selected>Countries</option>-->
<#--                        <option value="1">c1</option>-->
<#--                        <option value="2">c2</option>-->
<#--                        <option value="3">c3</option>-->
<#--                        <option value="4">c4</option>-->
<#--                    </select>-->
<#--                </div>-->
<#--                <div class="col-auto my-1">-->
<#--                    <select class="custom-select mr-sm-2" id="inlineFormCustomSelect2">-->
<#--                        <option selected>Year</option>-->
<#--                        <option value="1">2019</option>-->
<#--                        <option value="2">2018</option>-->
<#--                        <option value="3">2017</option>-->
<#--                        <option value="4">2016</option>-->
<#--                        <option value="5">2015</option>-->
<#--                    </select>-->
<#--                </div>-->
<#--                <div class="col-auto my-1">-->
<#--                    <select class="custom-select mr-sm-2" id="inlineFormCustomSelect3">-->
<#--                        <option selected>Popularity</option>-->
<#--                        <option value="1">Date</option>-->
<#--                    </select>-->
<#--                </div>-->
<#--                <button type="button" class="btn btn-b btn-default">Find</button>-->