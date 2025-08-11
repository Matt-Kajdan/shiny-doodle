<script>
    import Project from "../../lib/components/Project.svelte";

    const title = "Habits"

    const descriptionMap = {
    0: "Goal tracking app",
    1: "",
    2: "",
    3: "",
    4: "",
    };
    
    const images = [
        "./work/habits/card.png"
]

</script>

<Project 
    title={title}
    descriptionMap={descriptionMap}
    images={images}
/>
