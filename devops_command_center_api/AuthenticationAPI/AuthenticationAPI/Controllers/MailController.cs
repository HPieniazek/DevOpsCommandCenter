using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using static System.Runtime.InteropServices.JavaScript.JSType;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AuthenticationAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MailController : ControllerBase
    {
        // GET: api/<MailController>
        [HttpGet]
        public IActionResult Get([FromBody] JObject data, [FromHeader(Name="Authorizatuion")] string token, [FromHeader(Name = "Username")] string username)
        {
            if (string.IsNullOrWhiteSpace(token) || !AuthController.IsTokenValid(username, token))
            {
                return Unauthorized();
            }

            // Teraz możemy przetworzyć dane, ponieważ wiemy, że token jest poprawny
            // Na przykład możemy po prostu zwrócić je w odpowiedzi
            return Ok(data);
        }

        //// GET api/<MailController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        //// POST api/<MailController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<MailController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<MailController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
