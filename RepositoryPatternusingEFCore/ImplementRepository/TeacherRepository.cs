using Microsoft.AspNetCore.Mvc;
using RepositoryPatternusingEFCore.Data;
using RepositoryPatternusingEFCore.Model;
using RepositoryPatternusingEFCore.Repository;

namespace RepositoryPatternusingEFCore.ImplementRepository
{
    public class TeacherRepository: ITeacherRepository
    {
        private readonly ManytoManyContext _teacherRepo;

        public TeacherRepository(ManytoManyContext teacherRepo)
        {
            _teacherRepo = teacherRepo;
        }

        public async Task<ActionResult<Teacher>> TeacherGetById(int Id)
        {
            var teachers = await _teacherRepo.Teachers.FindAsync(Id);
            if (teachers == null)
                Console.WriteLine("Teacher Not Found");
            return teachers;
        }

        public async Task<ActionResult<Teacher>>AddTeacher(Teacher teacherId)
        {
            var newTeacher = new Teacher
            {
                TeacherName = teacherId.TeacherName,
            };
            _teacherRepo.Teachers.Add(newTeacher);

            await _teacherRepo.SaveChangesAsync();

            return (newTeacher);
        }

        public async Task<ActionResult<Teacher>>UpdateTeacher(Teacher updateTeacher)
        {
            var updateOneTeacher = await _teacherRepo.Teachers.FindAsync(updateTeacher.TeacherId);
            if (updateOneTeacher == null)
                Console.WriteLine("Teacher not Found");

            updateOneTeacher.TeacherName=updateTeacher.TeacherName;
            await _teacherRepo.SaveChangesAsync();
            return (updateOneTeacher);
        }

        public async Task<ActionResult<Teacher>>DeleteTeacher(int id)
        {
            var takeTeacherId = await _teacherRepo.Teachers.FindAsync(id);
            if (takeTeacherId == null)
                Console.WriteLine("Teacher Not found");

            _teacherRepo.Remove(takeTeacherId);
            await _teacherRepo.SaveChangesAsync(); 
            return takeTeacherId;
        }

    }
}
