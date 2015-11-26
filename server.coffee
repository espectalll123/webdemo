express = require 'express'
parser = require 'body-parser'
mongoose = require 'mongoose'
crypto = require 'crypto'

app = express()
app.use parser.urlencoded { extended: false }
app.set 'view engine', 'jade'

userSchema = new mongoose.Schema
        username: String
        password: String

        firstName: String
        lastName: String

        birthDate: Date
        genre: String
        color: String

        eMail: String

user = mongoose.model('userSchema', userSchema);

mongoose.connect 'mongodb://127.0.0.1/la75'
db = mongoose.connection

###
app.get '/db', (req, res) ->
        user.find (e, d) -> res.send JSON.stringify d
###

app.post '/register', (req, res) ->
        user.find username: req.body.username, (e, d) ->
                if d.length isnt 0
                        res.render 'register',
                                title: "¡Fallido!"
                                message: "El usuario ya existe;" +
                                        "inténtelo con otro ID."
                                face: ':('
                else
                        thisUser = new user
                                username: req.body.username
                                password: crypto.createHash 'sha512'
                                        .update req.body.password
                                        .digest 'hex'

                                firstName: req.body.firstname
                                lastName: req.body.lastName

                                birthDate: new Date(req.body.birthdate)
                                genre: req.body.genre
                                color: req.body.color

                                eMail: req.body.email

                        thisUser.save (err) ->
                                if err
                                        title = "¡Fallido!"
                                        message = "Se ha producido un " +
                                        "error desconocido. Lo sentimos."
                                        face = ':('
                                else
                                        console.log( "New user: " +
                                                req.body.username )
                                        title = "¡Registrado!"
                                        message = "¡Gracias por " +
                                        "registrarse! Abriremos " +
                                        "próximamente..."
                                        face = ':3'
                                res.render 'register',
                                        title: title,
                                        message: message,
                                        face: face

app.use express.static '.'

db.once 'open', ->
        app.listen 80
