namespace RepositoryPatternusingEFCore.Model
{
    public class Student
    {
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        
        public virtual ICollection<Teacher> Teachers { get; set; }

    }
}
