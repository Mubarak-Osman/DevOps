import hashlib
import os
import sqlite3

from flask import Flask, flash, redirect, render_template, request, session, url_for

# Configure Flask to look for templates and static files in the parent directory
app = Flask(__name__, template_folder='../templates', static_folder='../static')
app.secret_key = 'your-secret-key-here'  # In production, use environment variable


@app.route('/')
def home():
    return "Welcome to the TechStyle E-Commerce Application!"


@app.route('/products')
def product_listing():
    return "Here is a list of products."


@app.route('/new/')
def new_user():
    """Display registration form"""
    return render_template('new.html', msg='')


@app.route('/register', methods=['GET', 'POST'])
@app.route('/register/', methods=['GET', 'POST'])
def register():
    """Handle user registration"""
    if request.method == 'GET':
        return render_template('new.html', msg='')

    if request.method == 'POST':
        # For now, just return success for the test
        # In a real app, you'd validate and store user data
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')

        if username and email and password:
            # Simulate successful registration
            return redirect(url_for('login'))
        else:
            return render_template('new.html', msg='Please fill in all fields')


@app.route('/login/')
def login():
    """Display login form"""
    return render_template('login.html', msg='')


@app.route('/logged/', methods=['POST'])
def logged():
    """Handle login form submission"""
    # For now, just simulate login
    return redirect(url_for('home'))


@app.route('/logout/')
def logout():
    """Handle user logout"""
    session.clear()
    return redirect(url_for('home'))


if __name__ == '__main__':
    app.run()