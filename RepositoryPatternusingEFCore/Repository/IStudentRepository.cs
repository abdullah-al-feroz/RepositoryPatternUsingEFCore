using Microsoft.AspNetCore.Mvc;
using RepositoryPatternusingEFCore.Model;

namespace RepositoryPatternusingEFCore.Repository
{
    public interface IStudentRepository
    {
        public Task<ActionResult<List<Student>>> GetAll(int StudentId);
        public Task<ActionResult<Student>> AddStudent(Student StudentId);
        public Task<ActionResult<Student>> UpdateStudent(Student UpdateStudentId);
        public Task<ActionResult<Student>> DeleteStudent(int id);
    }
}
