# Engineering Nexus Hub - Backend Setup Guide

## Quick Setup (3 Steps)

### Step 1: Create Database
1. Open XAMPP → Start Apache & MySQL
2. Open phpMyAdmin: http://localhost/phpmyadmin
3. Click "Import" tab
4. Select file: `backend/database.sql`
5. Click "Go"

### Step 2: Configure API
1. Edit `backend/public/api/index.php`
2. Update DB credentials if needed:
   ```php
   define('DB_HOST', 'localhost');
   define('DB_NAME', 'enh');
   define('DB_USER', 'root');
   define('DB_PASS', '');
   ```

### Step 3: Test API
1. Open URL in browser: http://localhost/enaa/backend/public/api/
2. Should return: `{"success":false,"message":"Endpoint not found"}`
3. Test login: POST to `/auth/login`
   ```json
   {"email":"admin@enh.com","password":"password123"}
   ```

## Test Accounts

| Email | Password | Role |
|-------|----------|------|
| admin@enh.com | password123 | Admin |
| john@enh.com | password123 | Student |

## API Endpoints

### Auth
- `POST /auth/register` - Register new user
- `POST /auth/login` - Login
- `POST /auth/logout` - Logout
- `GET /auth/me` - Get current user
- `PUT /auth/profile` - Update profile

### Courses
- `GET /courses` - List all courses
- `GET /courses/{id}` - Get course details
- `POST /courses/enroll/{id}` - Enroll in course
- `GET /courses/enrolled` - My enrolled courses

### Jobs
- `GET /jobs` - List all jobs
- `GET /jobs/{id}` - Get job details
- `POST /jobs/apply/{id}` - Apply for job

### Community
- `GET /questions` - List questions
- `GET /questions/{id}` - Get question with answers
- `POST /questions` - Post question
- `POST /questions/{id}/answers` - Post answer

### Stats
- `GET /stats` - Platform statistics

## Connect Frontend to Backend

Add to HTML files:
```html
<script src="/enaa/frontend/js/api.js"></script>
```

Use in JS:
```javascript
// Login
await ApiService.auth.login(email, password);

// Get courses
const { data } = await ApiService.courses.getAll();

// Enroll
await ApiService.courses.enroll(courseId);
```

## Troubleshooting

### Database Connection Error
- Check XAMPP MySQL is running
- Verify credentials in index.php
- Make sure database exists

### CORS Error
- Add headers to index.php:
```php
header('Access-Control-Allow-Origin: *');
```

### 500 Internal Error
- Check PHP error logs
- Enable error reporting:
```php
error_reporting(E_ALL);
ini_set('display_errors', 1);
```

## File Structure

```
backend/
├── database.sql          # Database setup
├── .env                 # Environment config
├── public/
│   └── api/
│       ├── index.php    # Main API
│       └── .htaccess    # URL rewrite
├── database/
│   └── migrations/      # Laravel migrations
└── app/
    └── Models/          # Eloquent models
```