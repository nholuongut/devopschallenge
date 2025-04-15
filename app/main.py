# SimpleTimeService - Minimal Web Service
# Author: Nho Luong
# Email: luongutnho@hotmail.com

from flask import Flask, request, jsonify
from datetime import datetime

# Create Flask application
app = Flask(__name__)

# Define route "/"
@app.route('/')
def index():
    return jsonify({
        "timestamp": datetime.utcnow().isoformat(),  # Current UTC timestamp
        "ip": request.remote_addr                    # Client IP address
    })

# For Gunicorn compatibility, do not call app.run()
