namespace RepositoryPatternusingEFCore.Model
{
    public class StudentTeacher
    {
        public int StudentTeacherId { get; set; }
        public Student Students { get; set; }
        public int StudentId { get; set; }


        public Teacher Teachers { get; set; }
        public int TeacherId { get; set; }
    }
}
