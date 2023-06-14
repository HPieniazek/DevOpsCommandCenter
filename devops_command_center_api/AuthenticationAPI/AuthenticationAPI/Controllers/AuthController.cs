using AuthenticationAPI.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Concurrent;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AuthenticationAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private static readonly ConcurrentDictionary<string, string> _users = new ConcurrentDictionary<string, string>
        {
            ["admin"] = "admin",
            ["user"] = "password"
        };

        private static readonly ConcurrentDictionary<string, string> _tokens = new ConcurrentDictionary<string, string>();

        [HttpPost("login")]
        public IActionResult Login([FromBody] AuthModel login)
        {
            if (IsTokenValid( login.User, login.Token))
            {
                var token = Guid.NewGuid().ToString();
                _tokens[login.User] = token;  // Associate the token with a user
                return Ok();
            }

            return Unauthorized();
        }

        [HttpPost("register")]
        public IActionResult Register([FromBody] RegisterModel registerModel)
        {
            if (string.IsNullOrWhiteSpace(registerModel.User) || string.IsNullOrWhiteSpace(registerModel.Password))
            {
                return BadRequest("Username and password cannot be empty");
            }

            if (_users.ContainsKey(registerModel.User))
            {
                return BadRequest("Username already exists");
            }

            _users[registerModel.User] = registerModel.Password;

            var token = Guid.NewGuid().ToString();
            _tokens[registerModel.User] = token;  // Associate the token with the user

            return Ok(token);
        }

        internal static bool IsTokenValid(string username, string token)
        {
            return _tokens.TryGetValue(username, out var correctToken) && token == correctToken;
        }


        //// GET: api/<AuthenticationController>
        //[HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        //// GET api/<AuthenticationController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        //// POST api/<AuthenticationController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<AuthenticationController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<AuthenticationController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
