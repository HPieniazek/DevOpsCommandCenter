namespace DevOpsCommandCenterAPI
{
    public class Machine
    {
        public string Name { get; set; }
        
        public List<string> Commands { get; set; }

        public string Version { get; set; }

        public string Description { get; set; }
        public Machine() { }

    }
}
