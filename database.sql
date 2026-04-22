-- Engineering Nexus Hub Database Setup
-- Run this in phpMyAdmin to create the database

-- Create database
CREATE DATABASE IF NOT EXISTS enh CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE enh;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'instructor', 'engineer', 'admin') DEFAULT 'student',
    field ENUM('civil', 'mechanical', 'electrical', 'software', 'general') DEFAULT 'general',
    bio TEXT,
    skills JSON,
    avatar VARCHAR(500),
    phone VARCHAR(20),
    location VARCHAR(255),
    status ENUM('active', 'inactive', 'suspended') DEFAULT 'active',
    remember_token VARCHAR(100),
    email_verified_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Courses table
CREATE TABLE IF NOT EXISTS courses (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    field ENUM('civil', 'mechanical', 'electrical', 'software') NOT NULL,
    level ENUM('beginner', 'intermediate', 'advanced') NOT NULL,
    thumbnail VARCHAR(500),
    duration VARCHAR(50),
    rating INT DEFAULT 0,
    students INT DEFAULT 0,
    instructor_id BIGINT UNSIGNED,
    is_published BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (instructor_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Enrollments table
CREATE TABLE IF NOT EXISTS enrollments (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED,
    course_id BIGINT UNSIGNED,
    progress INT DEFAULT 0,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    UNIQUE KEY unique_enrollment (user_id, course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Lessons table
CREATE TABLE IF NOT EXISTS lessons (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    course_id BIGINT UNSIGNED,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    video_url VARCHAR(500),
    duration VARCHAR(20) DEFAULT '10 min',
    lesson_order INT DEFAULT 0,
    is_free BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Jobs table
CREATE TABLE IF NOT EXISTS jobs (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    company VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    type ENUM('Full-time', 'Part-time', 'Contract', 'Remote', 'Internship') NOT NULL,
    salary VARCHAR(100),
    field ENUM('civil', 'mechanical', 'electrical', 'software', 'general') DEFAULT 'general',
    posted_by BIGINT UNSIGNED,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (posted_by) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Applications table
CREATE TABLE IF NOT EXISTS applications (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED,
    job_id BIGINT UNSIGNED,
    status ENUM('pending', 'reviewed', 'interview', 'rejected', 'accepted') DEFAULT 'pending',
    cover_letter TEXT,
    resume VARCHAR(500),
    applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES jobs(id) ON DELETE CASCADE,
    UNIQUE KEY unique_application (user_id, job_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Questions table
CREATE TABLE IF NOT EXISTS questions (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED,
    title VARCHAR(500) NOT NULL,
    body TEXT NOT NULL,
    field ENUM('civil', 'mechanical', 'electrical', 'software', 'general') DEFAULT 'general',
    votes INT DEFAULT 0,
    views INT DEFAULT 0,
    is_solved BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Answers table
CREATE TABLE IF NOT EXISTS answers (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    question_id BIGINT UNSIGNED,
    user_id BIGINT UNSIGNED,
    body TEXT NOT NULL,
    votes INT DEFAULT 0,
    is_accepted BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert sample data
INSERT INTO users (id, name, email, password, role, field, bio, created_at, updated_at) VALUES
(1, 'Admin User', 'admin@enh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'software', 'Platform Administrator', NOW(), NOW()),
(2, 'John Smith', 'john@enh.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'student', 'electrical', 'Electrical Engineering Student', NOW(), NOW());

INSERT INTO courses (id, title, description, field, level, duration, rating, students, instructor_id, is_published, created_at, updated_at) VALUES
(1, 'Circuit Analysis Fundamentals', 'Learn the basics of electrical circuit analysis including Ohms Law, Kirchhoffs Laws, and circuit theorems.', 'electrical', 'beginner', '4 hours', 45, 1250, 1, TRUE, NOW(), NOW()),
(2, 'Digital Electronics Basics', 'Introduction to digital logic gates, flip-flops, and combinational circuits.', 'electrical', 'beginner', '3 hours', 42, 890, 1, TRUE, NOW(), NOW()),
(3, 'Thermodynamics: From Basics to Advanced', 'Comprehensive course covering thermodynamic principles, heat transfer, and energy systems.', 'mechanical', 'intermediate', '6 hours', 48, 2100, 1, TRUE, NOW(), NOW()),
(4, 'Structural Engineering Masterclass', 'Learn structural analysis, design principles, and practical applications in civil engineering.', 'civil', 'advanced', '8 hours', 46, 750, 1, TRUE, NOW(), NOW()),
(5, 'Python for Engineers', 'Learn Python programming with focus on engineering applications and problem solving.', 'software', 'beginner', '5 hours', 49, 3200, 1, TRUE, NOW(), NOW());

INSERT INTO jobs (id, title, description, company, location, type, salary, field, posted_by, is_active, created_at, updated_at) VALUES
(1, 'Junior Electrical Engineer', 'Design and maintain medical equipment electrical systems. Join our team to work on innovative healthcare technology.', 'MedTech Solutions', 'Mogadishu', 'Full-time', '$800 - $1,200/month', 'electrical', 1, TRUE, NOW(), NOW()),
(2, 'Software Developer', 'Develop web and mobile applications. Create solutions that impact thousands of users across Somalia.', 'TechHub Somalia', 'Garowe', 'Full-time', '$1,000 - $1,500/month', 'software', 1, TRUE, NOW(), NOW()),
(3, 'Civil Engineer', 'Supervise construction projects. Work on infrastructure development and building design.', 'BuildCorp', 'Hargeisa', 'Contract', '$900 - $1,400/month', 'civil', 1, TRUE, NOW(), NOW()),
(4, 'Mechanical Technician', 'Maintain and repair mechanical systems. Diagnose issues and perform preventive maintenance.', 'AutoWorks', 'Mogadishu', 'Full-time', '$700 - $1,000/month', 'mechanical', 1, TRUE, NOW(), NOW());

INSERT INTO questions (id, user_id, title, body, field, votes, views, is_solved, created_at, updated_at) VALUES
(1, 2, 'How to calculate resistance in a complex circuit?', 'I have a circuit with multiple resistors in series and parallel configuration. How do I simplify it to find the total resistance?', 'electrical', 15, 234, TRUE, NOW(), NOW()),
(2, 2, 'Best programming language for mechanical engineers?', 'Im a mechanical engineering student looking to learn programming. Which language would be most useful for my career?', 'mechanical', 23, 456, FALSE, NOW(), NOW());

INSERT INTO answers (id, question_id, user_id, body, votes, is_accepted, created_at, updated_at) VALUES
(1, 1, 1, 'For complex circuits, use Kirchhoffs Laws: 1) Sum of voltages around a loop = 0, 2) Current into junction = current out. Simplify step by step starting with parallel resistors first.', 12, TRUE, NOW(), NOW());

-- Create index for faster queries
CREATE INDEX idx_courses_field ON courses(field, is_published);
CREATE INDEX idx_questions_field ON questions(field);
CREATE INDEX idx_jobs_field ON jobs(field, is_active);
CREATE INDEX idx_enrollments_user ON enrollments(user_id);