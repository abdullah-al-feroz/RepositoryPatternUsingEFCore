using Microsoft.AspNetCore.Mvc;
using RepositoryPatternusingEFCore.Model;

namespace RepositoryPatternusingEFCore.Repository
{
    public interface ITeacherRepository
    {
        public Task<ActionResult<Teacher>> TeacherGetById(int Id);
        public Task<ActionResult<Teacher>> AddTeacher(Teacher teacherId);
        public Task<ActionResult<Teacher>> UpdateTeacher(Teacher updateTeacher);
        public Task <ActionResult<Teacher>> DeleteTeacher(int id);
    }
}

