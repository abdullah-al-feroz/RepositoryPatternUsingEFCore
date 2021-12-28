namespace RepositoryPatternusingEFCore.Model
{
    public class Teacher
    {
        public int TeacherId { get; set; }
        public string TeacherName { get; set; }
        public ICollection<Student> Students { get; set; }
    }
}
