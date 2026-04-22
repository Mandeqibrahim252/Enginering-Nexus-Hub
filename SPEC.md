# Engineering Nexus Hub - Technical Specification Document

## 1. Project Overview

### Project Name
Engineering Nexus Hub

### Project Type
Full-Stack Web Platform (LMS + Community + Jobs + Tools)

### Core Summary
An all-in-one ecosystem for engineering students, professionals, and instructors that integrates learning management, engineering tools, job listings, resource library, and community interaction.

### Target Users
- Students: Engineering learners seeking courses, tools, resources, and job opportunities
- Engineers: Professionals sharing knowledge, applying for jobs, and engaging in discussions
- Instructors: Educators creating and uploading course content
- Administrators: System managers for users, content, and platform monitoring

### Technology Stack
- **Frontend**: HTML5, CSS3, JavaScript (Vanilla), Bootstrap 5
- **Backend**: PHP (Laravel Framework)
- **Database**: MySQL
- **Authentication**: JWT-based
- **File Storage**: Local storage with proper directory structure

---

## 2. UI/UX Design System

### 2.1 Color Palette

| Color Role | Name | Hex Code | Usage |
|------------|------|----------|-------|
| Primary | Engineering Blue | `#2563EB` | Buttons, links, accents, header |
| Primary Hover | Deep Blue | `#1D4ED8` | Button hover states |
| Primary Light | Light Blue | `#DBEAFE` | Backgrounds, cards highlight |
| Secondary | Slate Gray | `#64748B` | Secondary text, borders |
| Accent | Emerald Green | `#10B981` | Success states, progress |
| Warning | Amber | `#F59E0B` | Warning messages |
| Danger | Red | `#EF4444` | Error states, delete actions |
| Background Light | White | `#FFFFFF` | Light mode background |
| Background Dark | Dark Slate | `#0F172A` | Dark mode background |
| Surface Light | Light Gray | `#F8FAFC` | Card backgrounds |
| Surface Dark | Dark Gray | `#1E293B` | Dark mode cards |
| Text Primary | Dark Slate | `#1E293B` | Primary text |
| Text Secondary | Gray | `#64748B` | Secondary text |
| Text Muted | Light Gray | `#94A3B8` | Muted text, placeholders |

### 2.2 Typography

| Element | Font Family | Size | Weight |
|---------|-------------|------|--------|
| H1 | Inter | 32px | 700 |
| H2 | Inter | 28px | 700 |
| H3 | Inter | 24px | 600 |
| H4 | Inter | 20px | 600 |
| Body | Inter | 16px | 400 |
| Small | Inter | 14px | 400 |
| Caption | Inter | 12px | 400 |

### 2.3 Spacing System

| Name | Value |
|------|-------|
| xs | 4px |
| sm | 8px |
| md | 16px |
| lg | 24px |
| xl | 32px |
| 2xl | 48px |
| 3xl | 64px |

### 2.4 Border Radius

| Name | Value |
|------|-------|
| sm | 4px |
| md | 8px |
| lg | 12px |
| xl | 16px |
| full | 9999px |

### 2.5 Shadows

```css
/* Card Shadow */
box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1), 0 1px 2px rgba(0, 0, 0, 0.06);

/* Elevated Shadow */
box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);

/* Modal Shadow */
box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
```

### 2.6 Design Components

#### Buttons
- **Primary**: Blue background (#2563EB), white text, 8px padding, 8px radius
- **Secondary**: White background, blue border, blue text
- **Danger**: Red background (#EF4444), white text
- **Ghost**: Transparent, gray text, no background
- **States**: Hover (darken 10%), Active (scale 0.98), Disabled (opacity 0.5)

#### Cards
- White/dark background
- 12px border radius
- Subtle shadow
- Hover: lift effect with elevated shadow
- Transition: 0.3s ease

#### Forms
- Input fields with 8px border radius
- 1px border (#E2E8F0)
- Focus: blue border, light blue glow
- Error: red border, error message below

#### Navigation
- Sidebar: 250px width, dark background (#0F172A)
- Navbar: 64px height, white/dark background
- Mobile: hamburger menu with slide-out drawer

---

## 3. Frontend Pages & Components

### 3.1 Page Structure

```
├── pages/
│   ├── index.html              (Landing/Home Page)
│   ├── auth/
│   │   ├── login.html
│   │   └── register.html
│   ├── dashboard.html
│   ├── courses/
│   │   ├── courses.html        (Course Listing)
│   │   └── course-detail.html  (Single Course)
│   ├── tools.html
│   ├── resources.html
│   ├── jobs/
│   │   ├── jobs.html          (Job Listings)
│   │   └── job-detail.html    (Single Job)
│   ├── community/
│   │   ├── forum.html         (Q&A Forum)
│   │   └── question.html      (Single Question)
│   └── profile.html
├── components/
│   ├── navbar.html
│   ├── sidebar.html
│   ├── footer.html
│   ├── card.html
│   └── modal.html
├── css/
│   ├── main.css
│   ├── variables.css
│   └── components.css
├── js/
│   ├── main.js
│   ├── auth.js
│   ├── api.js
│   └── utils.js
└── assets/
    ├── images/
    └── icons/
```

### 3.2 Page Details

#### Home Page (index.html)
- **Hero Section**: Full-width banner with tagline "Empowering Engineering Excellence"
- **Features Grid**: 4 cards highlighting LMS, Tools, Jobs, Community
- **Stats Section**: User count, courses, jobs, resources
- **Testimonials**: User testimonials carousel
- **CTA**: Register button

#### Login/Register Pages
- Centered card layout
- Role selection (Student/Engineer/Instructor)
- Social login buttons (optional)
- Form validation with error messages

#### Dashboard
- **Sidebar**: Navigation menu based on user role
- **Main Content**:
  - Welcome message with user name
  - Stats cards (courses in progress, applications, etc.)
  - Recent activity feed
  - Quick access buttons
- **Widgets**: Progress chart, upcoming deadlines, notifications

#### Courses Page
- Filter by field (Civil, Mechanical, Electrical, Software)
- Search bar
- Grid/List view toggle
- Course cards with:
  - Thumbnail
  - Title
  - Instructor
  - Rating
  - Duration
  - Progress bar (if enrolled)

#### Course Detail Page
- Course header (title, instructor, field)
- Tab navigation: Overview | Content | Reviews
- Video player for lessons
- Downloadable materials list
- Quiz sections
- Progress tracker sidebar
- Enroll button

#### Tools Page
- Grid of calculator cards:
  - Ohm's Law Calculator
  - Unit Converter
  - Load Calculator
  - Circuit Simulator
  - Structural Calculator
- Interactive inputs with real-time results

#### Resources Page
- Filter sidebar (field, type)
- Search bar
- Grid of resource cards:
  - File type icon
  - Title
  - Description
  - Upload date
  - Download count
  - Download button

#### Jobs Page
- Filter sidebar (location, type, field)
- Search bar
- Job cards:
  - Company logo
  - Job title
  - Company name
  - Location
  - Type (Full-time/Internship)
  - Posted date
  - Apply button

#### Job Detail Page
- Company header
- Job description
- Requirements
- Benefits
- Application form
- Company profile link

#### Community/Forum Page
- Categories sidebar
- Search bar
- Question list:
  - Title
  - Tags
  - Author
  - Answers count
  - Votes
  - Time posted
- Ask question button

#### Question Detail Page
- Question content
- Code blocks (if applicable)
- Answers list with voting
- Answer form
- Comments section

#### Profile Page
- Avatar upload
- Personal information form
- Skills tags
- Education history
- Experience
- Activity history

---

## 4. Backend API Structure

### 4.1 API Base URL
```
http://localhost:8000/api/v1
```

### 4.2 Endpoints

#### Authentication
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | /auth/register | Register new user |
| POST | /auth/login | Login user |
| POST | /auth/logout | Logout user |
| GET | /auth/me | Get current user |
| PUT | /auth/profile | Update profile |

#### Users
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /users | List all users (admin) |
| GET | /users/{id} | Get user by ID |
| PUT | /users/{id} | Update user |
| DELETE | /users/{id} | Delete user (admin) |

#### Courses
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /courses | List all courses |
| GET | /courses/{id} | Get course details |
| POST | /courses | Create course (instructor) |
| PUT | /courses/{id} | Update course |
| DELETE | /courses/{id} | Delete course |
| GET | /courses/{id}/lessons | Get course lessons |
| POST | /courses/{id}/enroll | Enroll in course |

#### Lessons
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /lessons/{id} | Get lesson details |
| POST | /lessons | Create lesson (instructor) |
| PUT | /lessons/{id} | Update lesson |
| DELETE | /lessons/{id} | Delete lesson |
| POST | /lessons/{id}/complete | Mark lesson complete |

#### Quizzes
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /quizzes/{id} | Get quiz questions |
| POST | /quizzes/{id}/submit | Submit quiz answers |

#### Resources
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /resources | List all resources |
| GET | /resources/{id} | Get resource details |
| POST | /resources | Upload resource |
| PUT | /resources/{id} | Update resource |
| DELETE | /resources/{id} | Delete resource |
| GET | /resources/download/{id} | Download resource |

#### Jobs
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /jobs | List all jobs |
| GET | /jobs/{id} | Get job details |
| POST | /jobs | Create job (admin/employer) |
| PUT | /jobs/{id} | Update job |
| DELETE | /jobs/{id} | Delete job |
| POST | /jobs/{id}/apply | Apply for job |
| POST | /jobs/{id}/bookmark | Bookmark job |

#### Applications
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /applications | List my applications |
| GET | /applications/{id} | Get application details |
| PUT | /applications/{id}/status | Update status (admin) |

#### Forum
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | /questions | List all questions |
| GET | /questions/{id} | Get question details |
| POST | /questions | Ask question |
| PUT | /questions/{id} | Update question |
| DELETE | /questions/{id} | Delete question |
| POST | /questions/{id}/answers | Post answer |
| POST | /questions/{id}/vote | Vote on question |

#### Answers
| Method | Endpoint | Description |
|--------|----------|-------------|
| PUT | /answers/{id} | Update answer |
| DELETE | /answers/{id} | Delete answer |
| POST | /answers/{id}/vote | Vote on answer |
| POST | /answers/{id}/accept | Accept answer |

#### Tools (Calculators)
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | /tools/ohms-law | Calculate Ohm's Law |
| POST | /tools/unit-convert | Convert units |
| POST | /tools/load-calc | Calculate load |
| POST | /tools/circuit-sim | Simulate circuit |

### 4.3 API Response Format

#### Success
```json
{
  "success": true,
  "message": "Operation successful",
  "data": {
    // resource data
  },
  "meta": {
    "page": 1,
    "per_page": 15,
    "total": 100
  }
}
```

#### Error
```json
{
  "success": false,
  "message": "Error description",
  "errors": {
    "field": ["Error message"]
  }
}
```

---

## 5. Database Schema

### 5.1 Database: `engineering_nexus`

### 5.2 Tables

#### users
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | User ID |
| name | VARCHAR(255) | NOT NULL | Full name |
| email | VARCHAR(255) | UNIQUE, NOT NULL | Email address |
| password | VARCHAR(255) | NOT NULL | Hashed password |
| role | ENUM | DEFAULT 'student' | student, engineer, instructor, admin |
| avatar | VARCHAR(255) | NULL | Avatar file path |
| bio | TEXT | NULL | User biography |
| skills | JSON | NULL | Skills array |
| field | ENUM | NULL | engineering field |
| phone | VARCHAR(20) | NULL | Phone number |
| location | VARCHAR(255) | NULL | User location |
| status | ENUM | DEFAULT 'active' | active, inactive, suspended |
| email_verified_at | TIMESTAMP | NULL | Email verification time |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |
| updated_at | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP | Update time |

#### courses
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Course ID |
| title | VARCHAR(255) | NOT NULL | Course title |
| description | TEXT | NOT NULL | Course description |
| field | ENUM | NOT NULL | civil, mechanical, electrical, software |
| thumbnail | VARCHAR(255) | NULL | Thumbnail path |
| instructor_id | INT | FK -> users(id) | Instructor user ID |
| price | DECIMAL(10,2) | DEFAULT 0.00 | Course price |
| duration | INT | NULL | Duration in hours |
| level | ENUM | DEFAULT 'beginner' | beginner, intermediate, advanced |
| is_published | TINYINT | DEFAULT 0 | Publish status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |
| updated_at | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP | Update time |

#### modules
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Module ID |
| course_id | INT | FK -> courses(id) | Related course |
| title | VARCHAR(255) | NOT NULL | Module title |
| description | TEXT | NULL | Module description |
| order | INT | DEFAULT 0 | Display order |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |

#### lessons
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Lesson ID |
| module_id | INT | FK -> modules(id) | Related module |
| title | VARCHAR(255) | NOT NULL | Lesson title |
| content | TEXT | NULL | Lesson content |
| video_url | VARCHAR(255) | NULL | Video URL |
| duration | INT | NULL | Duration in minutes |
| order | INT | DEFAULT 0 | Display order |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |

#### quizzes
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Quiz ID |
| lesson_id | INT | FK -> lessons(id) | Related lesson |
| title | VARCHAR(255) | NOT NULL | Quiz title |
| passing_score | INT | DEFAULT 70 | Passing score % |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |

#### quiz_questions
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Question ID |
| quiz_id | INT | FK -> quizzes(id) | Related quiz |
| question | TEXT | NOT NULL | Question text |
| options | JSON | NOT NULL | Answer options |
| correct_answer | INT | NOT NULL | Correct option index |
| points | INT | DEFAULT 1 | Question points |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |

#### enrollments
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Enrollment ID |
| user_id | INT | FK -> users(id) | Student user ID |
| course_id | INT | FK -> courses(id) | Course ID |
| progress | INT | DEFAULT 0 | Progress percentage |
| enrolled_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Enrollment time |
| completed_at | TIMESTAMP | NULL | Completion time |

#### lesson_progress
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Progress ID |
| user_id | INT | FK -> users(id) | User ID |
| lesson_id | INT | FK -> lessons(id) | Lesson ID |
| completed | TINYINT | DEFAULT 0 | Completion status |
| completed_at | TIMESTAMP | NULL | Completion time |

#### quiz_attempts
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Attempt ID |
| user_id | INT | FK -> users(id) | User ID |
| quiz_id | INT | FK -> quizzes(id) | Quiz ID |
| score | INT | NULL | Score achieved |
| answers | JSON | NULL | Answers submitted |
| passed | TINYINT | NULL | Pass/Fail status |
| attempted_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Attempt time |

#### resources
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Resource ID |
| title | VARCHAR(255) | NOT NULL | Resource title |
| description | TEXT | NULL | Resource description |
| file_path | VARCHAR(255) | NOT NULL | File path |
| file_type | ENUM | NOT NULL | pdf, note, exam, project |
| field | ENUM | NULL | engineering field |
| uploaded_by | INT | FK -> users(id) | Uploader user ID |
| downloads | INT | DEFAULT 0 | Download count |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |

#### jobs
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Job ID |
| title | VARCHAR(255) | NOT NULL | Job title |
| company | VARCHAR(255) | NOT NULL | Company name |
| description | TEXT | NOT NULL | Job description |
| requirements | TEXT | NULL | Job requirements |
| benefits | TEXT | NULL | Job benefits |
| field | ENUM | NOT NULL | engineering field |
| job_type | ENUM | NOT NULL | full-time, part-time, internship |
| location | VARCHAR(255) | NULL | Job location |
| salary_min | DECIMAL(12,2) | NULL | Minimum salary |
| salary_max | DECIMAL(12,2) | NULL | Maximum salary |
| posted_by | INT | FK -> users(id) | Poster user ID |
| is_active | TINYINT | DEFAULT 1 | Active status |
| expires_at | TIMESTAMP | NULL | Expiration date |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |

#### applications
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Application ID |
| user_id | INT | FK -> users(id) | Applicant user ID |
| job_id | INT | FK -> jobs(id) | Job ID |
| cover_letter | TEXT | NULL | Cover letter |
| resume_path | VARCHAR(255) | NULL | Resume file path |
| status | ENUM | DEFAULT 'pending' | pending, accepted, rejected |
| applied_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Application time |

#### bookmarks
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Bookmark ID |
| user_id | INT | FK -> users(id) | User ID |
| job_id | INT | FK -> jobs(id) | Job ID |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |

#### questions
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Question ID |
| title | VARCHAR(255) | NOT NULL | Question title |
| body | TEXT | NOT NULL | Question body |
| tags | JSON | NULL | Tags array |
| user_id | INT | FK -> users(id) | Question author |
| votes | INT | DEFAULT 0 | Vote count |
| answers_count | INT | DEFAULT 0 | Answers count |
| views | INT | DEFAULT 0 | View count |
| is_resolved | TINYINT | DEFAULT 0 | Resolution status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |
| updated_at | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP | Update time |

#### answers
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Answer ID |
| question_id | INT | FK -> questions(id) | Related question |
| body | TEXT | NOT NULL | Answer body |
| user_id | INT | FK -> users(id) | Answer author |
| votes | INT | DEFAULT 0 | Vote count |
| is_accepted | TINYINT | DEFAULT 0 | Accepted status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |
| updated_at | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP | Update time |

#### votes
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Vote ID |
| user_id | INT | FK -> users(id) | Voter user ID |
| question_id | INT | FK -> questions(id) | Question ID (nullable) |
| answer_id | INT | FK -> answers(id) | Answer ID (nullable) |
| vote_type | TINYINT | NOT NULL | 1 = upvote, -1 = downvote |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |

#### notifications
| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | INT | PK, AUTO_INCREMENT | Notification ID |
| user_id | INT | FK -> users(id) | Recipient user ID |
| type | VARCHAR(50) | NOT NULL | Notification type |
| title | VARCHAR(255) | NOT NULL | Notification title |
| message | TEXT | NOT NULL | Notification message |
| link | VARCHAR(255) | NULL | Related link |
| is_read | TINYINT | DEFAULT 0 | Read status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation time |

### 5.3 Indexes
```sql
-- Users
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_users_status ON users(status);

-- Courses
CREATE INDEX idx_courses_field ON courses(field);
CREATE INDEX idx_courses_instructor ON courses(instructor_id);
CREATE INDEX idx_courses_published ON courses(is_published);

-- Enrollments
CREATE INDEX idx_enrollments_user ON enrollments(user_id);
CREATE INDEX idx_enrollments_course ON enrollments(course_id);

-- Resources
CREATE INDEX idx_resources_field ON resources(field);
CREATE INDEX idx_resources_type ON resources(file_type);
CREATE INDEX idx_resources_uploader ON resources(uploaded_by);

-- Jobs
CREATE INDEX idx_jobs_field ON jobs(field);
CREATE INDEX idx_jobs_type ON jobs(job_type);
CREATE INDEX idx_jobs_posted ON jobs(posted_by);
CREATE INDEX idx_jobs_active ON jobs(is_active);

-- Applications
CREATE INDEX idx_applications_user ON applications(user_id);
CREATE INDEX idx_applications_job ON applications(job_id);
CREATE INDEX idx_applications_status ON applications(status);

-- Questions
CREATE INDEX idx_questions_user ON questions(user_id);
CREATE INDEX idx_questions_resolved ON questions(is_resolved);

-- Answers
CREATE INDEX idx_answers_question ON answers(question_id);
CREATE INDEX idx_answers_user ON answers(user_id);

-- Votes
CREATE INDEX idx_votes_user ON votes(user_id);
CREATE INDEX idx_votes_question ON votes(question_id);
CREATE INDEX idx_votes_answer ON votes(answer_id);
```

---

## 6. Folder Structure

### 6.1 Project Root Structure
```
engineering-nexus-hub/
├── frontend/
│   ├── pages/
│   │   ├── auth/
│   │   │   ├── login.html
│   │   │   └── register.html
│   │   ├── courses/
│   │   │   ├── courses.html
│   │   │   └── course-detail.html
│   │   ├── jobs/
│   │   │   ├── jobs.html
│   │   │   └── job-detail.html
│   │   ├── community/
│   │   │   ├── forum.html
│   │   │   └── question.html
│   │   ├── index.html
│   │   ├── dashboard.html
│   │   ├── tools.html
│   │   ├── resources.html
│   │   └── profile.html
│   ├── css/
│   │   ├── variables.css
│   │   ├── main.css
│   │   ├── components.css
│   │   └── pages.css
│   ├── js/
│   │   ├── main.js
│   │   ├── api.js
│   │   ├── auth.js
│   │   ├── components/
│   │   │   ├── navbar.js
│   │   │   ├── sidebar.js
│   │   │   ├── cards.js
│   │   │   └── modals.js
│   │   └── pages/
│   │       ├── dashboard.js
│   │       ├── courses.js
│   │       ├── tools.js
│   │       ├── resources.js
│   │       ├── jobs.js
│   │       └── community.js
│   └── assets/
│       ├── images/
│       │   ├── logo.svg
│       │   └── favicon.svg
│       └── icons/
│           └── icons.svg
│
├── backend/
│   ├── app/
│   │   ├── Console/
│   │   │   └── Kernel.php
│   │   ├── Exceptions/
│   │   │   └── Handler.php
│   │   ├── Http/
│   │   │   ├── Controllers/
│   │   │   │   ├── Auth/
│   │   │   │   │   ├── AuthController.php
│   │   │   │   │   └── VerificationController.php
│   │   │   │   ├── Course/
│   │   │   │   │   ├── CourseController.php
│   │   │   │   │   ├── LessonController.php
│   │   │   │   │   └── QuizController.php
│   │   │   │   ├── Resource/
│   │   │   │   │   └── ResourceController.php
│   │   │   │   ├── Job/
│   │   │   │   │   ├── JobController.php
│   │   │   │   │   └── ApplicationController.php
│   │   │   │   ├── Forum/
│   │   │   │   │   ├── QuestionController.php
│   │   │   │   │   └── AnswerController.php
│   │   │   │   ├── Tool/
│   │   │   │   └── CalculatorController.php
│   │   │   │   ├── User/
│   │   │   │   │   └── UserController.php
│   │   │   │   └── Controller.php
│   │   │   ├── Middleware/
│   │   │   │   ├── Authenticate.php
│   │   │   │   ├── VerifyEmail.php
│   │   │   │   ├── RoleCheck.php
│   │   │   │   └── TrimStrings.php
│   │   │   └── Requests/
│   │   │       ├── StoreCourseRequest.php
│   │   │       ├── StoreJobRequest.php
│   │   │       └── StoreQuestionRequest.php
│   │   ├── Models/
│   │   │   ├── User.php
│   │   │   ├── Course.php
│   │   │   ├── Module.php
│   │   │   ├── Lesson.php
│   │   │   ├── Quiz.php
│   │   │   ├── QuizQuestion.php
│   │   │   ├── Resource.php
│   │   │   ├── Job.php
│   │   │   ├── Application.php
│   │   │   ├── Question.php
│   │   │   ├── Answer.php
│   │   │   └── Notification.php
│   │   ├── Providers/
│   │   │   ├── AppServiceProvider.php
│   │   │   ├── AuthServiceProvider.php
│   │   │   └── RouteServiceProvider.php
│   │   └── Traits/
│   │       └── HasRoles.php
│   ├── bootstrap/
│   │   ├── app.php
│   │   └── cache/
│   ├── config/
│   │   ├── app.php
│   │   ├── auth.php
│   │   ├── database.php
│   │   ├── filesystems.php
│   │   └── jwt.php
│   ├── database/
│   │   ├── migrations/
│   │   │   ├── 2024_01_01_000001_create_users_table.php
│   │   │   ├── 2024_01_01_000002_create_courses_table.php
│   │   │   ├── 2024_01_01_000003_create_modules_table.php
│   │   │   ├── 2024_01_01_000004_create_lessons_table.php
│   │   │   ├── 2024_01_01_000005_create_quizzes_table.php
│   │   │   ├── 2024_01_01_000006_create_resources_table.php
│   │   │   ├── 2024_01_01_000007_create_jobs_table.php
│   │   │   ├── 2024_01_01_000008_create_applications_table.php
│   │   │   ├── 2024_01_01_000009_create_questions_table.php
│   │   │   ├── 2024_01_01_000010_create_answers_table.php
│   │   │   └── 2024_01_01_000011_create_notifications_table.php
│   │   ├── seeders/
│   │   │   ├── DatabaseSeeder.php
│   │   │   ├── UserSeeder.php
│   │   │   └── CourseSeeder.php
│   │   └── factories/
│   │       ├── UserFactory.php
│   │       ├── CourseFactory.php
│   │       └── JobFactory.php
│   ├── public/
│   │   ├── index.php
│   │   │   ├── css/
│   │   │   └── js/
│   ├── resources/
│   │   └── views/
│   │       ├── errors/
│   │       │   └── 404.blade.php
│   │       └── welcome.blade.php
│   ├── routes/
│   │   ├── api.php
│   │   ├── channels.php
│   │   └── web.php
│   ├── storage/
│   │   ├── app/
│   │   ├── framework/
│   │   │   ├── cache/
│   │   │   ├── sessions/
│   │   │   └── views/
│   │   └── logs/
│   ├── tests/
│   │   ├── Feature/
│   │   └── Unit/
│   ├── .env
│   ├── artisan
│   ├── composer.json
│   ├── package.json
│   ├── phpunit.xml
│   └── server.php
│
├── database/
│   └── schema.sql
│
└── docs/
    ├── README.md
    ├── API.md
    └── DEPLOYMENT.md
```

---

## 7. Authentication & Authorization

### 7.1 JWT Structure
```json
{
  "access_token": "eyJ0eXAiOiJKV1QiLCJhbGc...",
  "token_type": "bearer",
  "expires_in": 3600
}
```

### 7.2 Roles & Permissions

| Role | Permissions |
|------|-------------|
| student | learn, use_tools, apply_jobs, download_resources, post_questions |
| engineer | learn, use_tools, post_jobs, download_resources, post_questions, answer |
| instructor | +create_courses, +upload_content |
| admin | full_access, manage_users, manage_content |

### 7.3 Middleware
- `auth:api` - Verify JWT token
- `role:admin` - Admin only
- `role:instructor` - Instructor and above

---

## 8. Engineering Tools

### 8.1 Ohm's Law Calculator
- Inputs: Voltage (V), Current (A), Resistance (Ω)
- Formula: V = IR
- Output: Calculated value + visual diagram

### 8.2 Unit Converter
- Length: mm, cm, m, km, in, ft, yd, mi
- Mass: mg, g, kg, ton, lb, oz
- Force: N, kN, lbf
- Pressure: Pa, kPa, MPa, bar, psi

### 8.3 Load Calculator
- Input: Area, material type
- Output: Estimated load in kN

### 8.4 Circuit Simulator
- Basic circuit builder
- Series/parallel configurations
- Current flow visualization

---

## 9. Performance & Optimization

### 9.1 Frontend
- Lazy loading for images
- Code splitting per page
- LocalStorage for user session
- CSS minification
- Image optimization

### 9.2 Backend
- Database indexing
- Query optimization with eager loading
- Rate limiting on API
- Response caching
- JWT token refresh

### 9.3 Security
- CSRF protection
- XSS prevention
- SQL injection prevention
- Password hashing (bcrypt)
- CORS configuration

---

## 10. Acceptance Criteria

### 10.1 Authentication
- [x] User can register with role selection
- [x] User can login and receive JWT
- [x] JWT expires after 1 hour
- [x] Protected routes require valid JWT

### 10.2 LMS
- [x] Courses display by field
- [x] User can enroll in courses
- [x] Progress tracking works
- [x] Quizzes calculate scores

### 10.3 Tools
- [x] Ohm's Law calculator accurate
- [x] Unit converter works
- [x] Real-time calculations

### 10.4 Jobs
- [x] Jobs list with filters
- [x] Application submission works
- [x] Status tracking available

### 10.5 Community
- [x] Questions can be posted
- [x] Answers can be submitted
- [x] Voting system works

### 10.6 Responsive
- [x] Works on mobile (< 768px)
- [x] Works on tablet (768px - 1024px)
- [x] Works on desktop (> 1024px)

---

## Document Information
- **Version**: 1.0.0
- **Last Updated**: April 2026
- **Author**: Engineering Nexus Team