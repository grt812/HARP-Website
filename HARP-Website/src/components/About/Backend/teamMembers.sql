-- Using the link to Neon DB, to run the script, use the following command:
-- psql "postgresql://teamMembersDB_owner:npg_TW2amo6dINZF@ep-holy-unit-a8aq9e5m-pooler.eastus2.azure.neon.tech/teamMembersDB?sslmode=require"
-- \i path/to/this/script.sql

-- Use curl http://localhost:3000/api/team-members (this should print out the SQL table)
-- Base Cases for inserting, updating, and deleting team members is given below. Uncomment and then compile the script for the changes to take effect

-- Create team_members table
--CREATE TABLE team_members (
--     name VARCHAR(100) NOT NULL,
--     role VARCHAR(100) NOT NULL,
--     founder BOOLEAN DEFAULT false,
--     management BOOLEAN DEFAULT false,
--     image_path TEXT NOT NULL,
--     github_url VARCHAR(255),
--     linkedin_url VARCHAR(255),
--     semester VARCHAR(50),
--     member_type VARCHAR(50)
-- );

-- Insert team members data
-- INSERT INTO team_members (name, role, founder, image_path, github_url, linkedin_url, semester, member_type) VALUES
--     ('Ashley Chan', 'UI/UX Designer Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/AshleyChan.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Fall 2024', 'Developer'),
--     ('Aoyan Sarkar', 'Full Stack Development Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/AoyanSarkar.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Fall 2024', 'Developer'),
--     ('Caleb Dodson', 'Full Stack Development Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/CalebDodson.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Fall 2024', 'Developer'),
--     ('Luke Summa', 'Full Stack Development Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/LukeSumma.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Fall 2024', 'Developer'),
--     ('Michael Ortega', 'Full Stack Development Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MichaelOrtega.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Fall 2024', 'Developer'),
--     ('Linus Zwaka', 'Research Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/LinusZwaka.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Fall 2024', 'Researcher');
    
   
-- Update the image paths for all team members
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/HarperChisari.png' WHERE name = 'Harper Chisari';
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/YuvalShimoni.png' WHERE name = 'Yuval Shimoni';
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/DanaSolitaire.png' WHERE name = 'Dana Solitaire';
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/GarrettGee.png' WHERE name = 'Garrett Gee';
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/ShaneStoll.png' WHERE name = 'Shane Stoll';
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/KemuelNunez.png' WHERE name = 'Kemuel Nunez';


 INSERT INTO team_members (name, role, founder, image_path, github_url, linkedin_url, semester, member_type) VALUES
    ('Derek Lee', 'Full Stack Development Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/Spring 2025/DerekLee.png', 'https://github.com/kagiri2', 'https://www.linkedin.com/in/derekzlee/', 'Spring 2025', 'Developer');

UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/Intern/Spring 2025/RitikaBrahmadesam.png' WHERE name = 'Ritika Brahmadesam';



-- UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/KevinScott_NOBG.png' WHERE name = 'Kevin Scott';















-- ALTER TABLE team_members DROP COLUMN management;    



    ------------------------------- INFORMATION ARCHIVE (SORTED BY POSITION) -------------------------------
--  Founders and Management Team
    -- ('Harper Chisari', 'CEO, Vice President of Core Research', true, 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/HarperChisari/HarperChisari.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Admin', 'Admin')
    -- ('Yuval Shimoni', 'Vice President of Business Development', true, 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/YuvalShimoni/Yuval Card.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Admin', 'Admin'),
    -- ('Kevin Scott', 'Vice President of Customer Success', true, 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/KevinScott/KevinScott.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Admin', 'Admin'),
    -- ('Dana Solitaire', 'Vice President of Custom Solutions Department', true, 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/DanaSolitaire/DanaSolitaire.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Admin', 'Admin'),
    -- ('Garrett Gee', 'Vice President of General Solutions Department', true, 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/GarrettGee/GarrettGee.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Admin', 'Admin'),
    -- ('Shane Stoll', 'Vice President of Talent Development', true, 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/ShaneStoll/ShaneStoll.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Admin', 'Admin'),
    -- ('Kemuel Nunez', 'Marketing Manager', true, 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/ShaneStoll/ShaneStoll.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Admin', 'Admin'),
    -- ('Derek Rubottom', 'Project Manager, DSP-OS 2', true, 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/ShaneStoll/ShaneStoll.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Admin', 'Admin'),
    -- ('William Chen', 'Project Manager, Web Projects', true, 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/WilliamChen/WilliamChen.png', 'https://github.com/dashboard', 'https://www.linkedin.com/feed/', 'Admin', 'Admin')

-- Applied Mathematics Interns
        -- ('Ritika Brahmadesam', 'Applied Mathematics Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MatthewTavares.png', 'https://github.com/bcritika', 'https://www.linkedin.com/in/bcritika/', 'Spring 2025', 'Researcher'),
    -- Cognitive Linguistics Interns
        -- ('Thomas Dou', 'Cognitive Linguistics Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MatthewTavares.png', 'https://github.com/tdou25', 'https://www.linkedin.com/in/thomas-dou-43120824b/', 'Spring 2025', 'Researcher')
-- Full Stack Development Interns
        -- ('Barbara Kotlan', 'Full Stack Development Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MatthewTavares.png', 'https://github.com/bjk2023', 'https://www.linkedin.com/in/barbara-kotlan/', 'Spring 2025', 'Developer'),
        -- ('Celine Cheung', 'Full Stack Development Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MatthewTavares.png', 'https://github.com/ccheung777', 'https://www.linkedin.com/in/celinech/', 'Spring 2025', 'Developer'),
        -- ('Matteo Rathgeber', 'Full Stack Development Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MatthewTavares.png', 'https://github.com/mrathgeber', 'https://www.linkedin.com/in/matteorathgeber/', 'Spring 2025', 'Developer'),
        -- ('Angela Imanuel', 'Full Stack Development Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MatthewTavares.png', 'https://github.com/anqelbun', 'https://www.linkedin.com/in/angela-imanuel/', 'Spring 2025', 'Developer'),
-- Hybrid ML Workflow Interns
        -- ('Chengyu Zhang', 'Hybrid Machine Learning Workflow Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MatthewTavares.png', 'https://github.com/gnehcuyz', 'https://www.linkedin.com/in/chengyuz/', 'Spring 2025', 'Researcher'),
        -- ('Aidan Flaherty', 'Hybrid Machine Learning Workflow Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MatthewTavares.png', 'https://github.com/aidan-n-flaherty', 'https://www.linkedin.com/in/aidan-n-flaherty', 'Spring 2025', 'Researcher'),
        -- ('Siddhant Agarwal', 'Hybrid Machine Learning Workflow Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MatthewTavares.png', 'https://github.com/siddhantagarwal151', 'https://www.linkedin.com/in/sidagar1/', 'Spring 2025', 'Researcher'),
-- Quantum Machine Learning Interns
        -- ('Mukul', 'Quantum Machine Learning Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MatthewTavares.png', 'https://github.com/mukul-quantum-researcher', 'https://www.linkedin.com/in/mukul-malik-47b9b1192/', 'Spring 2025', 'Researcher'),
        -- ('Ryan So', 'Quantum Machine Learning Intern', false, 'src/assets/HARPResearchLockUps/TeamMember/Intern/MatthewTavares.png', 'https://github.com/ryanso128', 'https://www.linkedin.com/in/ryanso128/', 'Spring 2025', 'Researcher')
