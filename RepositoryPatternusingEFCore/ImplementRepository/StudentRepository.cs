using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RepositoryPatternusingEFCore.Data;
using RepositoryPatternusingEFCore.Model;
using RepositoryPatternusingEFCore.Repository;

namespace RepositoryPatternusingEFCore.ImplementRepository
{
    public class StudentRepository: IStudentRepository
    {
        private readonly ManytoManyContext _db;

        public StudentRepository(ManytoManyContext db)
        {
            _db = db;
        }

        public async Task<ActionResult<List<Student>>> GetAll(int StudentId)
        {

            var students = await _db.Students
               .Include(a => a.Teachers)
               .Where(c => c.StudentId == StudentId)
               .ToListAsync();
            return students;
          
        }

        public async Task<ActionResult<Student>> AddStudent(Student StudentId)
        {

            var newStudent = new Student
            {
                StudentName = StudentId.StudentName,             

            };
            _db.Students.Add(newStudent);

            await _db.SaveChangesAsync();

            return (newStudent);
        }

        public async Task<ActionResult<Student>> UpdateStudent(Student UpdateStudentId)
        {
            var updateOneStudent = await _db.Students.FindAsync(UpdateStudentId.StudentId);
            if (updateOneStudent == null)
                Console.WriteLine("Student Not Found");

            updateOneStudent.StudentName = UpdateStudentId.StudentName;
          
            await _db.SaveChangesAsync();
            return (updateOneStudent);

        }

        public async Task<ActionResult<Student>> DeleteStudent(int id)
        {
            var takeStudentId = await _db.Students.FindAsync(id);
            if (takeStudentId == null)
                Console.WriteLine("Student Not found");

            _db.Remove(takeStudentId);
            await _db.SaveChangesAsync();
            return (takeStudentId);

        }
        

       
    }
}
