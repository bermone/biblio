package fr.bermosa.web;
import fr.bermosa.domain.LivresGroupes;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/livresgroupeses")
@Controller
@RooWebScaffold(path = "livresgroupeses", formBackingObject = LivresGroupes.class)
public class LivresGroupesController {
}
