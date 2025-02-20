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
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/ShaneStoll.png' WHERE name = 'Shane Stoll';
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/ManagementTeam/KemuelNunez.png' WHERE name = 'Kemuel Nunez';


UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/Intern/Spring 2025/AngelaImanuel.png' WHERE name = 'Angela Imanuel';
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/Intern/Spring 2025/BarbaraKotlan.png' WHERE name = 'Barbara Kotlan';
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/Intern/Spring 2025/JonathanSun.png' WHERE name = 'Jonathan Sun';
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/Intern/Spring 2025/ChengyuZhang.png' WHERE name = 'Chengyu Zhang';
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/Intern/Spring 2025/Mukul.png' WHERE name = 'Mukul';
UPDATE team_members SET image_path = 'src/assets/HARPResearchLockUps/TeamMember/Intern/Spring 2025/PeijingXu.png' WHERE name = 'Peijing Xu';





