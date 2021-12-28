using Microsoft.AspNetCore.Mvc;
using RepositoryPatternusingEFCore.Model;
using RepositoryPatternusingEFCore.Repository;

namespace RepositoryPatternusingEFCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ManytoManyController : ControllerBase
    {
        private readonly IStudentRepository _stdRepository;
        private ITeacherRepository _teacherRepo;

        public ManytoManyController(IStudentRepository repo, ITeacherRepository teacherRepo)
        {
            _stdRepository = repo;
            _teacherRepo = teacherRepo;
        }



        [HttpGet("StudentDetalis")]
        public async Task<ActionResult<List<Student>>>GetById(int studentId)
        {
            return await _stdRepository.GetAll(studentId);
        }

        [HttpPost("CreateStudent")]
        public async Task<ActionResult<Student>> AddStudent([FromBody] Student StudentId)
        {
            return await _stdRepository.AddStudent(StudentId);
        }

        [HttpPut("Update_Student")]
        public async Task<ActionResult<Student>> UpdateStudent(Student UpdateStudentId)
        {
            return await _stdRepository.UpdateStudent(UpdateStudentId);
            
        }

        [HttpDelete("Delete_A_Student")]
        public async Task<ActionResult<Student>> DeleteStudent(int id)
        {
            return await _stdRepository.DeleteStudent(id);
        }

        [HttpGet("TeacherDetalis")]
        public async Task<ActionResult<Teacher>> TeacherById(int Id)
        {
            return await _teacherRepo.TeacherGetById(Id);
        }

        [HttpPost("CreateTeacher")]
        public async Task<ActionResult <Teacher>>AddTeacher(Teacher teacherId)
        {
            return await _teacherRepo.AddTeacher(teacherId);
        }

        [HttpPut("UpdateTeacher")]
        public async Task<ActionResult<Teacher>>UpdateTeacher(Teacher updateTeacher)
        {
            return await _teacherRepo.UpdateTeacher(updateTeacher);
        }

        [HttpDelete("Delete_A_Teacher")]
        public async Task<ActionResult<Teacher>> DeleteTeacher(int id)
        {
            return await _teacherRepo.DeleteTeacher(id);
        }
    }
}
