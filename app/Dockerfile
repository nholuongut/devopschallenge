# Use a minimal Python base image
FROM python:3.12-slim

# Label the maintainer
LABEL maintainer="Nho Luong <luongutnho@hotmail.com>"

# Create non-root user for security
RUN addgroup --system app && adduser --system --ingroup app appuser

# Set working directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the app code
COPY . .

# Switch to non-root user
USER appuser

# Run with Gunicorn for production
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]
