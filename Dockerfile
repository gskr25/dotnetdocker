# Use the official .NET Core SDK image as the base
FROM mcr.microsoft.com/dotnet/sdk:6.0.100

# Set up a non-root user
RUN groupadd -g 1001 appuser && \
    useradd -r -u 1001 -g appuser appuser

# Set the working directory
WORKDIR /app

# Change ownership of the working directory to the appuser
RUN chown -R appuser:appuser /app

# Switch to the appuser
USER appuser

# Copy the application files
COPY ./app

# Build the application
RUN dotnet build

# Expose the necessary port
EXPOSE 80

# Start the application
CMD ["dotnet", "run"]